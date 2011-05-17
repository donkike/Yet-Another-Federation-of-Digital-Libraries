xml.instruct!

xml.metadata do
  for record in @records
      xml.record do
        xml.title record.title
        for creator in record.creators
          xml.creator creator.name
        end
        for subject in record.subjects
          xml.subject subject.name
        end
        xml.identifier record.identifier
        xml.url record.url
    end
  end
end