Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DCCA10F6A5
	for <lists+linux-doc@lfdr.de>; Tue,  3 Dec 2019 06:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbfLCFLS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 3 Dec 2019 00:11:18 -0500
Received: from mail-pf1-f202.google.com ([209.85.210.202]:47559 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbfLCFLS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Dec 2019 00:11:18 -0500
Received: by mail-pf1-f202.google.com with SMTP id e62so1440899pfh.14
        for <linux-doc@vger.kernel.org>; Mon, 02 Dec 2019 21:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=JS26lqPOsyf+GCzfh2q7I14K35HWfvfL+jqbIeTiEhs=;
        b=K1e8TPhpNMFVfy3zpUvxGh3rgUGzKKm5sRwldvLEOIz/KQFH4IXBVzoD7xIeXW+sI+
         OHuBZYRP4c76okFVaCmF7t+ZhiyQ47NNKd8za4hEYxZ/9eN2nJNM68LEf9dSAhEHOwN4
         a9+fCrUqBS2/vijwnB/zHYZ3QZP70NycgF/0gJuHNVgL4OVsK9mXOkllWTRUysHBF+wa
         Gak/gb8gp9GJqewrQ7lybxNuknjIdN/43X38dwmp6wpmPxfFAzDAyu5634JeWK/S45eI
         j3VRm8PmCQYeh3ZNcfCFmHhOhd5swp1KGjEMgNcsj8Lz9Zt42UsPXNuvXXoYDhc3LwDH
         UWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=JS26lqPOsyf+GCzfh2q7I14K35HWfvfL+jqbIeTiEhs=;
        b=ctQb0QoIRmpjLxRPr3QJU63aLE9DHN15i8yac13bDza91E6iHPnd7Q3LUUIpzuDMWg
         PEPFAdHsGbI5PHUTsS62EzKWoCcE1tff01ia1+Rdgqi7XHdhqzYlo0VYmP1xXVphE3Hy
         D8vBUHTsuz6q8htdIBEQuNHOCwwLU9YP84F339ZfVO4ix0wRw7RpNAIz64xIyb1/ye46
         LinaDAW17+rqcnyQulCdEO5x6i5yfeO6yXZPLQSl/HASI14Yaai34BrvsKjmJngKuzFE
         vygOzXbChFfdEbpChHvrX9eVp1vvpaoQYtMTglMFf7ATrN2RTIKPF1xXtPZKO3R4NS68
         5b+g==
X-Gm-Message-State: APjAAAV49DRthf/rTF0kdSxL/ODwqZkD1y37NfKeXCq9Up/d8Q1LhFVs
        I5s1KStka6xRueIjeV59/zdhmocsCYg=
X-Google-Smtp-Source: APXvYqwAUHq1SM7kgd3huIBZdhakSOyUU8oN/jfGh2+n4qRA8Pa17aUBVqzak3AMNCxa4UE+GvJKUKnGXqc=
X-Received: by 2002:a63:4104:: with SMTP id o4mr3339080pga.169.1575349877576;
 Mon, 02 Dec 2019 21:11:17 -0800 (PST)
Date:   Mon,  2 Dec 2019 21:10:41 -0800
Message-Id: <20191203051049.44573-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
Subject: [PATCH 0/8] Support for Casefolding and Encryption
From:   Daniel Rosenberg <drosen@google.com>
To:     "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org,
        Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
        linux-f2fs-devel@lists.sourceforge.net,
        Eric Biggers <ebiggers@kernel.org>,
        linux-fscrypt@vger.kernel.org,
        Alexander Viro <viro@zeniv.linux.org.uk>
Cc:     Andreas Dilger <adilger.kernel@dilger.ca>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Gabriel Krisman Bertazi <krisman@collabora.com>,
        kernel-team@android.com, Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Ext4 and F2FS currently both support casefolding and encryption, but not at the
same time. These patches aim to rectify that.

Since directory names are stored case preserved, we cannot just take the hash
of the ciphertext. Instead we use the siphash of the casefolded name. With this
we no longer have a direct path from an encrypted name to the hash without the
key. To deal with this, fscrypt now always includes the hash in the name it
presents when the key is not present. There is a pre-existing bug where you can
change parts of the hash and still match the name so long as the disruption to
the hash does not happen to affect lookup on that filesystem. I'm not sure how
to fix that without making ext4 lookups slower in the more common case.

I moved the identical dcache operations for ext4 and f2fs into the VFS, as any
filesystem that uses casefolding will need the same code. This will also allow
further optimizations to that path, although my current changes don't take
advantage of that yet.

For Ext4, this also means that we need to store the hash on disk. We only do so
for encrypted and casefolded directories to avoid on disk format changes.
Previously encryption and casefolding could not live on the same filesystem,
and we're relaxing that requirement. F2fs is a bit more straightforward since
it already stores hashes on disk.

I've updated the related tools with just enough to enable the feature. I still
need to adjust their respective fsck's, although without access to the keys,
they won't be able to verify the hashes of casefolded and encrypted names.


Daniel Rosenberg (8):
  fscrypt: Add siphash and hash key for policy v2
  fscrypt: Don't allow v1 policies with casefolding
  fscrypt: Change format of no-key token
  vfs: Fold casefolding into vfs
  f2fs: Handle casefolding with Encryption
  ext4: Use struct super_blocks' casefold data
  ext4: Hande casefolding with encryption
  ext4: Optimize match for casefolded encrypted dirs

 Documentation/filesystems/ext4/directory.rst |  27 ++
 fs/crypto/Kconfig                            |   1 +
 fs/crypto/fname.c                            | 204 +++++++++---
 fs/crypto/fscrypt_private.h                  |   9 +
 fs/crypto/keysetup.c                         |  29 +-
 fs/crypto/policy.c                           |  26 +-
 fs/dcache.c                                  |  35 ++
 fs/ext4/dir.c                                |  72 +----
 fs/ext4/ext4.h                               |  87 +++--
 fs/ext4/hash.c                               |  26 +-
 fs/ext4/ialloc.c                             |   5 +-
 fs/ext4/inline.c                             |  41 +--
 fs/ext4/namei.c                              | 318 ++++++++++++-------
 fs/ext4/super.c                              |  21 +-
 fs/f2fs/dir.c                                | 115 +++----
 fs/f2fs/f2fs.h                               |  14 +-
 fs/f2fs/hash.c                               |  25 +-
 fs/f2fs/inline.c                             |   9 +-
 fs/f2fs/super.c                              |  17 +-
 fs/f2fs/sysfs.c                              |   8 +-
 fs/inode.c                                   |   8 +
 fs/namei.c                                   |  43 ++-
 include/linux/fs.h                           |  12 +
 include/linux/fscrypt.h                      | 107 +++----
 24 files changed, 797 insertions(+), 462 deletions(-)

-- 
2.24.0.393.g34dc348eaf-goog

