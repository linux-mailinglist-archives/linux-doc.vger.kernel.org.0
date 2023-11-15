Return-Path: <linux-doc+bounces-1592-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2BA7DEAFF
	for <lists+linux-doc@lfdr.de>; Thu,  2 Nov 2023 03:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED4F11C20E03
	for <lists+linux-doc@lfdr.de>; Thu,  2 Nov 2023 02:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B4B1849;
	Thu,  2 Nov 2023 02:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FfiWaHNm"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F12515D2;
	Thu,  2 Nov 2023 02:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667CDC433C8;
	Thu,  2 Nov 2023 02:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698893638;
	bh=wliHaT5QZ1Qs4h9Kv8Vuq1EXR4VPMNO+swxxXK8pI2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FfiWaHNmBnE4equDJohmlgDCUHDNxb07hGZrmQSJtpEocMDWmBGeYTWi2AZTw8j8h
	 NslJuVUJtCuyBJkDvRLuGYAYKOdBrpifUrauH0wAUfCnGHgY5nRjO74BQtAoCHX7oq
	 8c0boVj8sUYAyMM+kMTkDsevR6ASozZAe1vYQZSIcmQHc8lKxI2Vuw9dKVkTD0GPBE
	 K9AsmgwOIg4Ttn7fUk8WTXbtIMTD+hZsRvDr8Q2IPXHvdNiMw9DzMWj4EVjeqWpcav
	 za5v37/pFaQIPeY9rXzJrksMI5npYJ9oBAC1ZQehmisokLzIKHF0IU8IIFwyK+VyPe
	 nMAKYfTw6ee6Q==
Date: Wed, 1 Nov 2023 19:53:55 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: Fan Wu <wufan@linux.microsoft.com>, corbet@lwn.net, zohar@linux.ibm.com,
	jmorris@namei.org, serge@hallyn.com, tytso@mit.edu, axboe@kernel.dk,
	agk@redhat.com, snitzer@kernel.org, eparis@redhat.com,
	linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, audit@vger.kernel.org,
	roberto.sassu@huawei.com, linux-kernel@vger.kernel.org,
	Deven Bowers <deven.desai@linux.microsoft.com>
Subject: Re: [PATCH RFC v11 15/19] fsverity: consume builtin signature via
 LSM hook
Message-ID: <20231102025355.GA1498@sol.localdomain>
References: <1696457386-3010-16-git-send-email-wufan@linux.microsoft.com>
 <6efb7a80ba0eb3e02b3ae7a5c0a210f3.paul@paul-moore.com>
 <CAHC9VhQJkcb-k+o+NvVn7crrMMZqpBcZpnEbKBT+eZg4Ocjqhw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHC9VhQJkcb-k+o+NvVn7crrMMZqpBcZpnEbKBT+eZg4Ocjqhw@mail.gmail.com>

On Wed, Nov 01, 2023 at 08:40:06PM -0400, Paul Moore wrote:
> On Mon, Oct 23, 2023 at 11:52 PM Paul Moore <paul@paul-moore.com> wrote:
> > On Oct  4, 2023 Fan Wu <wufan@linux.microsoft.com> wrote:
> > >
> > > fsverity represents a mechanism to support both integrity and
> > > authenticity protection of a file, supporting both signed and unsigned
> > > digests.
> > >
> > > An LSM which controls access to a resource based on authenticity and
> > > integrity of said resource, can then use this data to make an informed
> > > decision on the authorization (provided by the LSM's policy) of said
> > > claim.
> > >
> > > This effectively allows the extension of a policy enforcement layer in
> > > LSM for fsverity, allowing for more granular control of how a
> > > particular authenticity claim can be used. For example, "all (built-in)
> > > signed fsverity files should be allowed to execute, but only these
> > > hashes are allowed to be loaded as kernel modules".
> > >
> > > This enforcement must be done in kernel space, as a userspace only
> > > solution would fail a simple litmus test: Download a self-contained
> > > malicious binary that never touches the userspace stack. This
> > > binary would still be able to execute.
> > >
> > > Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
> > > Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
> > > ---
> > > v1-v6:
> > >   + Not present
> > >
> > > v7:
> > >   Introduced
> > >
> > > v8:
> > >   + Split fs/verity/ changes and security/ changes into separate patches
> > >   + Change signature of fsverity_create_info to accept non-const inode
> > >   + Change signature of fsverity_verify_signature to accept non-const inode
> > >   + Don't cast-away const from inode.
> > >   + Digest functionality dropped in favor of:
> > >     ("fs-verity: define a function to return the integrity protected
> > >       file digest")
> > >   + Reworded commit description and title to match changes.
> > >   + Fix a bug wherein no LSM implements the particular fsverity @name
> > >     (or LSM is disabled), and returns -EOPNOTSUPP, causing errors.
> > >
> > > v9:
> > >   + No changes
> > >
> > > v10:
> > >   + Rename the signature blob key
> > >   + Cleanup redundant code
> > >   + Make the hook call depends on CONFIG_FS_VERITY_BUILTIN_SIGNATURES
> > >
> > > v11:
> > >   + No changes
> > > ---
> > >  fs/verity/fsverity_private.h |  2 +-
> > >  fs/verity/open.c             | 26 +++++++++++++++++++++++++-
> > >  include/linux/fsverity.h     |  2 ++
> > >  3 files changed, 28 insertions(+), 2 deletions(-)
> >
> > We need an ACK from some VFS folks on this.
> 
> Eric and/or Ted, can we get either an ACK or some feedback on this patch?
> 
> For reference, the full patchset can be found on lore at the link below:
> 
> https://lore.kernel.org/linux-security-module/1696457386-3010-1-git-send-email-wufan@linux.microsoft.com/

Well, technically I already gave some (minor) feedback on this exact patch, and
it's not yet been addressed:
https://lore.kernel.org/linux-security-module/20231005022707.GA1688@quark.localdomain/

Of course, it would also be nice if the commit message mentioned what the patch
actually does.

At a higher level, I've said before, I'm not super happy about the use of
fsverity builtin signatures growing.  (For some of the reasons why, see the
guidance in the fsverity documentation at
https://docs.kernel.org/filesystems/fsverity.html#built-in-signature-verification)
That being said, if the people who are doing the broader review of IPE believe
this is how its fsverity integration should work, I can live with that; I don't
intend to block the IPE patchset if enough people want it to be merged.  I've
really been hoping to see engagement with the people involved in IMA, as IPE
basically duplicates/replaces IMA.  But I haven't seen that, so maybe things
need to move on without them.

- Eric

