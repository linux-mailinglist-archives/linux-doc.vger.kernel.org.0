Return-Path: <linux-doc+bounces-17275-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B45418D4323
	for <lists+linux-doc@lfdr.de>; Thu, 30 May 2024 03:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A03A1C22AC0
	for <lists+linux-doc@lfdr.de>; Thu, 30 May 2024 01:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478961BC46;
	Thu, 30 May 2024 01:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="RwtgAkTz"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B53E17BA4
	for <linux-doc@vger.kernel.org>; Thu, 30 May 2024 01:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717033632; cv=none; b=RCDc4zfnvLNljE52h83YebRgT76hYx1mRRpP3PsTs8jQlFrmiE8FLJl5cGtJ9skmg0u27/x69T0gDBwq+0kp+3HqrPLguD1acD/JVWo3en4Qc7NQIzUHQ9iLefwXGeLVTe3pcyJ5sF/2z09SrKVC2qqUpe3K2wjy989fJ/vZDSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717033632; c=relaxed/simple;
	bh=x1jS0mxgpy/2saLRwCgP0IDOSIhPVz9T5ZHuv9e2c30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mlLLJc4n8WQH129fqbiwOCMa5fEd+zH/XEHAKYHYJxscGy17m9UMu0/aJq8Ua229iVq1P/AcygkD55Q2yhD2brjn7ZZ0W1mhW5ixWbRi33EBAk14cxoMbUnxrLCflDhL9ofusCJq4I4M1vKu5VHnizBrMdQIqdtDnQW1Zbxhs5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=RwtgAkTz; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-627e3368394so3280607b3.2
        for <linux-doc@vger.kernel.org>; Wed, 29 May 2024 18:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1717033629; x=1717638429; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtKBdXnoQfLOHhfUlX9Bxsk6L3lUvasMxrh9oed50QE=;
        b=RwtgAkTzeIe14CmGCyMksSR4l21XcWqOQkKoopcgKO/XLkZUIn4G/0i0q0lKZrcy4x
         xn68e3VSEarmh1mvNflXaLAyT29Gv70J4qQTPiTT05QTrRcMDjhNFl1k0s3cr14tBGG6
         yL71M4rAGeGLtcneYI7oXdXS7scDG95KWbSh3npaBfIrxNpZ9xwjoq1VUJFmfXrn8CRj
         KMEtKZPZrCDtknaqS5rNesrw9qnisExtDi3jgfHhEY7IUV9y1lfeVXDRq8GEYtPqrmkL
         FpMsJap7fFxb8yCjg7PMJWPjGZpfF+3y/IHrgo+lih0Ycse8GFpBMubGKutnNwI4dxvG
         KhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717033629; x=1717638429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtKBdXnoQfLOHhfUlX9Bxsk6L3lUvasMxrh9oed50QE=;
        b=SaJNpWaBzS6h9EUUh8qFShkr0qIg09V0mSI68GnYAcoZ41WLHFYsmRjy6tN6hh2EA7
         n+cKTicw9RKemwHyD6ZFJQH1EkCNtFxCocqYqpCS7fNTfsjqBs8cEG074wotS1WZBPMU
         XBCpuDFtO6Tj7vdeuXC2XfWMsGtq03gZiEzQAu6j8rtv1syyzmKSzMX1t4H1LqUh3KGE
         Cj32VidBavpcWati220JjxNkqPA3HneKSPntLCiSkkhzu9TUycTTCeXvz2e2aiAhxIPk
         SuBNNk5tPyk8YWPDfifGbRLIuwcvrbqCdF0TlhgcdsnC1KGcJo5jNSqyI9i8LkoW/2Yn
         iyMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXg3tURJQCB9QbZHDjKCwlLRgg9AWGvu09SKUQAvh8AakMZWgcNywZMxrHA8UePJ+i6eMXLw2Uc1HeNMKNmtYNyUL5sZZD/J7w
X-Gm-Message-State: AOJu0Yz4gSsr942po/XhrJTqgOK1dfWDPK0K/3qq12Ckb0Ufmft9UxVI
	0Rehk2b5QRju8LG+gTRluEzUo0sHzrUqNjZHtjxLrb55UWJXv2nEItK1Y7a70fKLt7HclVPdEMh
	D7igQk/Tt2/qsmFwyxSMZIwE55KSmU6sIPOdh
X-Google-Smtp-Source: AGHT+IHE8pHh5vgrRzbkNWJnz/7ABaPo+xQvVDp6nIkAadJxWm7yBQS/PqPj3c4uPz54TzSylU9FuipuoCMPbpIsfP8=
X-Received: by 2002:a05:690c:ecc:b0:627:ecd3:6223 with SMTP id
 00721157ae682-62c6bc79ed6mr10295197b3.35.1717033629104; Wed, 29 May 2024
 18:47:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1716583609-21790-1-git-send-email-wufan@linux.microsoft.com> <1716583609-21790-16-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1716583609-21790-16-git-send-email-wufan@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 29 May 2024 21:46:57 -0400
Message-ID: <CAHC9VhRsnGjZATBj7-evK6Gdryr54raTTKMYO_vup8AGXLwjQg@mail.gmail.com>
Subject: Re: [PATCH v19 15/20] fsverity: expose verified fsverity built-in
 signatures to LSMs
To: ebiggers@kernel.org, Fan Wu <wufan@linux.microsoft.com>
Cc: corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com, 
	tytso@mit.edu, axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, 
	mpatocka@redhat.com, eparis@redhat.com, linux-doc@vger.kernel.org, 
	linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-block@vger.kernel.org, 
	dm-devel@lists.linux.dev, audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Deven Bowers <deven.desai@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 4:46=E2=80=AFPM Fan Wu <wufan@linux.microsoft.com> =
wrote:
>
> This patch enhances fsverity's capabilities to support both integrity and
> authenticity protection by introducing the exposure of built-in
> signatures through a new LSM hook. This functionality allows LSMs,
> e.g. IPE, to enforce policies based on the authenticity and integrity of
> files, specifically focusing on built-in fsverity signatures. It enables
> a policy enforcement layer within LSMs for fsverity, offering granular
> control over the usage of authenticity claims. For instance, a policy
> could be established to permit the execution of all files with verified
> built-in fsverity signatures while restricting kernel module loading
> from specified fsverity files via fsverity digests.
>
> The introduction of a security_inode_setintegrity() hook call within
> fsverity's workflow ensures that the verified built-in signature of a fil=
e
> is exposed to LSMs. This enables LSMs to recognize and label fsverity fil=
es
> that contain a verified built-in fsverity signature. This hook is invoked
> subsequent to the fsverity_verify_signature() process, guaranteeing the
> signature's verification against fsverity's keyring. This mechanism is
> crucial for maintaining system security, as it operates in kernel space,
> effectively thwarting attempts by malicious binaries to bypass user space
> stack interactions.
>
> The second to last commit in this patch set will add a link to the IPE
> documentation in fsverity.rst.
>
> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
> Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
>
> ---
> v1-v6:
>   + Not present
>
> v7:
>   Introduced
>
> v8:
>   + Split fs/verity/ changes and security/ changes into separate patches
>   + Change signature of fsverity_create_info to accept non-const inode
>   + Change signature of fsverity_verify_signature to accept non-const ino=
de
>   + Don't cast-away const from inode.
>   + Digest functionality dropped in favor of:
>     ("fs-verity: define a function to return the integrity protected
>       file digest")
>   + Reworded commit description and title to match changes.
>   + Fix a bug wherein no LSM implements the particular fsverity @name
>     (or LSM is disabled), and returns -EOPNOTSUPP, causing errors.
>
> v9:
>   + No changes
>
> v10:
>   + Rename the signature blob key
>   + Cleanup redundant code
>   + Make the hook call depends on CONFIG_FS_VERITY_BUILTIN_SIGNATURES
>
> v11:
>   + No changes
>
> v12:
>   + Add constification to the hook call
>
> v13:
>   + No changes
>
> v14:
>   + Add doc/comment to built-in signature verification
>
> v15:
>   + Add more docs related to IPE
>   + Switch the hook call to security_inode_setintegrity()
>
> v16:
>   + Explicitly mention "fsverity builtin signatures" in the commit
>     message
>   + Amend documentation in fsverity.rst
>   + Fix format issue
>   + Change enum name
>
> v17:
>   + Fix various documentation issues
>   + Use new enum name LSM_INT_FSVERITY_BUILTINSIG_VALID
>
> v18:
>   + Fix typos
>   + Move the inode_setintegrity hook call into fsverity_verify_signature(=
)
>
> v19:
>   + Cleanup code w.r.t inode_setintegrity hook refactoring
> ---
>  Documentation/filesystems/fsverity.rst | 23 +++++++++++++++++++++--
>  fs/verity/signature.c                  | 18 +++++++++++++++++-
>  include/linux/security.h               |  1 +
>  3 files changed, 39 insertions(+), 3 deletions(-)

Eric, can you give this patch in particular a look to make sure you
are okay with everything?  I believe Fan has addressed all of your
previous comments and it would be nice to have your Ack/Review tag if
you are okay with the current revision.

--=20
paul-moore.com

