# expects a subject that is configured as a record
# expects the following context variables: subject, raw_data, new_raw_data

shared_examples_for "a change event observable" do
  context "A new record" do
    it "should notify publisher of created events" do
      expect(EmitEventService).to receive(:execute_call)
      subject.assign_attributes(valid_attributes)
      subject.save
    end
  end

  context "An existing record" do
    before do
      subject.save
      subject.reload
    end

    context "A record without notifiable changes since last update" do
      it "should not notify the observer of any changes" do
        expect(EmitEventService).to_not receive(:execute_call)
        subject.update(non_observerable_attributes)
      end
    end

    context "A record with data changes" do
      it "should notify the publisher with an updated event with changes" do
        expect(EmitEventService).to receive(:execute_call)
        subject.update(new_attributes)
      end
    end
  end
end
