Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 646381433B6
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jan 2020 23:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbgATWKV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 20 Jan 2020 17:10:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:43798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726607AbgATWKU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 20 Jan 2020 17:10:20 -0500
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net [107.3.166.239])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B1067217F4;
        Mon, 20 Jan 2020 22:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579558219;
        bh=aIfcrgdNwEPZNsAQByGxzIGHjX2yQUgR/4PQujAolNY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=w/Lnu/wx2pyhYNwA3Gm7pqtfSqG4B315J5B9m8INLk118BgahIqEXXAjkbMod06CZ
         u9gilV8dmwEswRs1xmikPda6Gcu0tt5vryDcPfuXyvxFrE+gzhruGgqZBZ2RgV0yK4
         l9BNDJan44RYXmJSnDXIQS5zEUyb4GREmwv02jao=
Date:   Mon, 20 Jan 2020 14:10:17 -0800
From:   Eric Biggers <ebiggers@kernel.org>
To:     Daniel Rosenberg <drosen@google.com>
Cc:     Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
        Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
        linux-f2fs-devel@lists.sourceforge.net,
        linux-fscrypt@vger.kernel.org,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Gabriel Krisman Bertazi <krisman@collabora.com>,
        kernel-team@android.com
Subject: Re: [PATCH v3 0/9] Support for Casefolding and Encryption
Message-ID: <20200120221017.GA29203@sol.localdomain>
References: <20200117214246.235591-1-drosen@google.com>
 <20200120045216.GB913@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200120045216.GB913@sol.localdomain>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jan 19, 2020 at 08:52:16PM -0800, Eric Biggers wrote:
> On Fri, Jan 17, 2020 at 01:42:37PM -0800, Daniel Rosenberg wrote:
> > These patches are all on top of fscrypt's developement branch
> > 
> > Ext4 and F2FS currently both support casefolding and encryption, but not at
> > the same time. These patches aim to rectify that.
> > 
> > Since directory names are stored case preserved, we cannot just take the hash
> > of the ciphertext. Instead we use the siphash of the casefolded name. With this
> > we no longer have a direct path from an encrypted name to the hash without the
> > key. To deal with this, fscrypt now always includes the hash in the name it
> > presents when the key is not present. There is a pre-existing bug where you can
> > change parts of the hash and still match the name so long as the disruption to
> > the hash does not happen to affect lookup on that filesystem. I'm not sure how
> > to fix that without making ext4 lookups slower in the more common case.
> > 
> > I moved the identical dcache operations for ext4 and f2fs into the VFS, as any
> > filesystem that uses casefolding will need the same code. This will also allow
> > further optimizations to that path, although my current changes don't take
> > advantage of that yet.
> > 
> > For Ext4, this also means that we need to store the hash on disk. We only do so
> > for encrypted and casefolded directories to avoid on disk format changes.
> > Previously encryption and casefolding could not live on the same filesystem,
> > and we're relaxing that requirement. F2fs is a bit more straightforward since
> > it already stores hashes on disk.
> > 
> > I've updated the related tools with just enough to enable the feature. I still
> > need to adjust ext4's fsck's, although without access to the keys,
> > neither fsck will be able to verify the hashes of casefolded and encrypted names.
> > 
> > v3 changes:
> > fscrypt patch only creates hash key if it will be needed.
> > Rebased on top of fscrypt branch, reconstified match functions in ext4/f2fs
> > 
> > v2 changes:
> > fscrypt moved to separate thread to rebase on fscrypt dev branch
> > addressed feedback, plus some minor fixes
> > 
> > 
> > Daniel Rosenberg (9):
> >   fscrypt: Add siphash and hash key for policy v2
> >   fscrypt: Don't allow v1 policies with casefolding
> >   fscrypt: Change format of no-key token
> >   fscrypt: Only create hash key when needed
> >   vfs: Fold casefolding into vfs
> >   f2fs: Handle casefolding with Encryption
> >   ext4: Use struct super_blocks' casefold data
> >   ext4: Hande casefolding with encryption
> >   ext4: Optimize match for casefolded encrypted dirs
> 
> Thanks for the new version of this patchset, Daniel!
> 
> I'd like to apply the first four patches (the fs/crypto/ part, to prepare for
> the new dirhash method) for 5.6, to get ready for the actual
> encrypted+casefolded support in filesystems later.
> 
> But we don't have much time left before the merge window, the more I look at the
> patches I'm still not very happy with them.  E.g., some comments I made haven't
> been addressed, it's missing updates to the documentation, and some of the code
> comments and commit messages are still confusing.  For one, there's still some
> ambiguity between the dirhash and the SHA-256 hash, and it's not really
> explained why the patch introduces the SHA-256 stuff, which actually has nothing
> to do with encrypted+casefold (other than it was a good opportunity to do it as
> the nokey name format had to be changed for encrypted+casefold anyway).
> 
> I also found a bug where the return value of base64_decode() isn't being checked
> properly.  We should also keep fscrypt_match_name() simpler by setting disk_name
> for short names, like we were before.  There are also some places that count the
> padding in struct fscrypt_nokey_name and some that don't, which is confusing.
> We also no longer need to call fscrypt_get_policy() during setflags, as we call
> fscrypt_require_key() now anyway.  And there's now some ambiguity about what's
> meant by a "per-file key", since now there will be 2 types of per-file keys.
> 
> So I hope you don't mind, but to move things along I've had a go at cleaning up
> the fscrypt patches, and I've sent out an updated version of them.  Can you
> please take a look when you have a chance?:
> https://lkml.kernel.org/linux-fscrypt/20200120044401.325453-1-ebiggers@kernel.org/T/#u
> 

The new fscrypt no-key name format also breaks UBIFS encryption.  So we'll need
a couple UBIFS fixes too.  I'll send out a new series that includes them.

- Eric
