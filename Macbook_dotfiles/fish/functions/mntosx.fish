function mntosx --wraps='sudo apfs-fuse -o uid=1000,gid=1000,allow_other /dev/nvme0n1p2 /mnt/macOS' --description 'alias mntosx sudo apfs-fuse -o uid=1000,gid=1000,allow_other /dev/nvme0n1p2 /mnt/macOS'
  sudo apfs-fuse -o uid=1000,gid=1000,allow_other /dev/nvme0n1p2 /mnt/macOS $argv
        
end
