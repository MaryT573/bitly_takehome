require './lib/click'

RSpec.describe Click do
    
    before do
        allow(File).to receive(:open).and_return('the contents of the file')
        allow(File).to receive(:read).and_return({"bitlink": "http://es.pn/3MgVNnZ", "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.13+ (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2", "timestamp": "2021-10-03T00:00:00Z", "referrer": "facebook.com", "remote_ip": "2.57.169.255"})
    end

    it 'can take csv' do
        filepath = "../data/encodes.csv"
        click = Click.new(filepath)

        expect(click).to be_instance_of(Click)
    end

    it 'returns json' do
        filepath = "../data/encodes.csv"
        filename = "../data/decodes.json"
        click = Click.new(filepath)
        
        expect(click.decode_access(filename)).to exist
    end
end