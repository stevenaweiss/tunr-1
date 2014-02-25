require 'spec_helper'
  describe PlaylistUser do 
    it { should belong_to(:user)}
    it { should belong_to(:playlist)}
    
end