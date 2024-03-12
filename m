Return-Path: <linux-doc+bounces-11961-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA072878BE2
	for <lists+linux-doc@lfdr.de>; Tue, 12 Mar 2024 01:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3181E1F212DD
	for <lists+linux-doc@lfdr.de>; Tue, 12 Mar 2024 00:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5938917FD;
	Tue, 12 Mar 2024 00:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dilger-ca.20230601.gappssmtp.com header.i=@dilger-ca.20230601.gappssmtp.com header.b="vnHcEE/A"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760D8365
	for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 00:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710202902; cv=none; b=swlVl1SOzWdr1ItEh7MPByoyeJZwE3A3uWDaOe6p4yvzsB78QRQrau03TvSSAgMrmuAgdlZj7jMiNHtyvNhZAwdZEwnog831k454/qYGLyX49KO337hKfAcsm+EIwbPVATyOGZe1SJ/6kZ//JWdQEhDzv2BupyaXFAyG3F8Opls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710202902; c=relaxed/simple;
	bh=wok4YHjHzCm35RvpC9w/b8FyNi1LqxjvfyXAqdd7HtI=;
	h=From:Message-Id:Content-Type:Mime-Version:Subject:Date:
	 In-Reply-To:Cc:To:References; b=KjVp+1+he4eRe173/R7boNBM1EF2iWSeyFr0ZHSjf2Kzmni/+fQP79tVIkzaQMpd0MeBb9GqL0ko9xhC8GWOSzSmlLXw5Vpu3sQm2sr9TEcJRqWX6woMvcoMGqyds+pUI9e42HHopZlywhXmVAG0y8i9VkUeOlYR+RTR+sA7cgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dilger.ca; spf=pass smtp.mailfrom=dilger.ca; dkim=pass (2048-bit key) header.d=dilger-ca.20230601.gappssmtp.com header.i=@dilger-ca.20230601.gappssmtp.com header.b=vnHcEE/A; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dilger.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dilger.ca
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e6082eab17so4542704b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 11 Mar 2024 17:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dilger-ca.20230601.gappssmtp.com; s=20230601; t=1710202898; x=1710807698; darn=vger.kernel.org;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7DlyNepupAOlfFd1hu/C7y4DR5yqWMh4x21bU4t8Ipo=;
        b=vnHcEE/Ach84/PJR5b8pFFmku2tR0CHAivWjsrhJz0SxGrOBrzCAN2Aa/jBVLtUu+D
         j76A7pic0rScXbSav50GmhBzx0UNKdX1JjADiITgnSD+LBr387Hl8vGH9drJg595O3lY
         FVnEi5gbPjGa/NLoxo1s8Xw2938BWO6jwdVjHbb5Sb7CLWnrE4W/EbvE0GBQqMfpyaWW
         yENtIMap1jnEdyPivh2YljpMadlnk4XpNVDJ1uxDAP3sU5E4WtkuwSf+ImL0hVgEj0ep
         gIVuOO5X6VqSXL+FfYrfwCYJn3P4NeFYDtr7GNwCNFPKgbxDBqCCMBryZ90aJBPpwOPq
         1/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710202898; x=1710807698;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7DlyNepupAOlfFd1hu/C7y4DR5yqWMh4x21bU4t8Ipo=;
        b=HEl6IWQ2m+vmvmEb5Mw6ESk9ddUHFJQVvv5W5oxVmXzRHrei3gqnrGm9PiSx/t6MZM
         z9xd+ayQ0n8EutMxLcrML4mca49ajUVDn2/dp2YEPG2uCUDtQMc1gkwD6XxO5PztVOWY
         /HfZGdkN0JKYb3vl/2Ts+QGx7ffpzNhBRy7ROIpMbo9GWTpNMtkcCV+WF04FbzQ4RnAd
         XuXObFIuXOGIyBCZKc+M/rlkhNU1OaQggJJWitKS8quZSsNseFM9/DAcbqbwdHVKNkMU
         fQPiHS9ujOerypN3+6rZ3QTZaLwvTBXZOawdmfPXqitaVgWF3IAyHRJP8cigGdWOzuUk
         xqUg==
X-Forwarded-Encrypted: i=1; AJvYcCWfLJ987axd1smZHFD5zbk/yxe94j7DejcGaY6nW3zVT7Fx8A0KdVrQ/c9nxVJgKwdzUPPbldCRazhO8n1OP6BxALzRWrSfEG6N
X-Gm-Message-State: AOJu0Yw5ls7WwD4XaVTKQkR7/D42KUjclhieLQhk+iDPiFYGKSONawRp
	CxKKmhObNe7jitpIghUvqAe+SOpmkKjMsl2lMHdSfbMomt2052FT2igq31grhTs=
X-Google-Smtp-Source: AGHT+IGtXX4nda2KFsEiX5pBRBxZOEK1e/R1gB6h/W9ovkrbHGYxxqnTJVinlBMPEx4vaMs/aCV3nw==
X-Received: by 2002:a05:6a00:928e:b0:6e6:9ad2:903a with SMTP id jw14-20020a056a00928e00b006e69ad2903amr2084465pfb.34.1710202897690;
        Mon, 11 Mar 2024 17:21:37 -0700 (PDT)
Received: from cabot.adilger.int (S01068c763f81ca4b.cg.shawcable.net. [70.77.200.158])
        by smtp.gmail.com with ESMTPSA id r2-20020a056a00216200b006e69ef5c79bsm714428pff.93.2024.03.11.17.21.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2024 17:21:36 -0700 (PDT)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <D8407E1D-F188-4115-A963-9EFBB515C45D@dilger.ca>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_0B942F10-F546-413C-AFD4-3D5B482470C1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH 1/3] add physical_length field to fiemap extents
Date: Mon, 11 Mar 2024 18:22:02 -0600
In-Reply-To: <0b423d44538f3827a255f1f842b57b4a768b7629.1709918025.git.sweettea-kernel@dorminy.me>
Cc: corbet@lwn.net,
 Al Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-doc@vger.kernel.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>,
 Chris Mason <clm@meta.com>,
 David Sterba <dsterba@suse.com>,
 Josef Bacik <josef@toxicpanda.com>,
 jbacik@toxicpanda.com,
 kernel-team@meta.com
To: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
References: <cover.1709918025.git.sweettea-kernel@dorminy.me>
 <0b423d44538f3827a255f1f842b57b4a768b7629.1709918025.git.sweettea-kernel@dorminy.me>
X-Mailer: Apple Mail (2.3273)


--Apple-Mail=_0B942F10-F546-413C-AFD4-3D5B482470C1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On Mar 8, 2024, at 11:03 AM, Sweet Tea Dorminy =
<sweettea-kernel@dorminy.me> wrote:
>=20
> Some filesystems support compressed extents which have a larger =
logical
> size than physical, and for those filesystems, it can be useful for
> userspace to know how much space those extents actually use. For
> instance, the compsize [1] tool for btrfs currently uses =
btrfs-internal,
> root-only ioctl to find the actual disk space used by a file; it would
> be better and more useful for this information to require fewer
> privileges and to be usable on more filesystems. Therefore, use one of
> the padding u64s in the fiemap extent structure to return the actual
> physical length; and, for now, return this as equal to the logical
> length.

Thank you for working on this patch.  Note that there was a patch from
David Sterba and a lengthy discussion about exactly this functionality
several years ago.  If you haven't already read the details, it would be
useful to do so. I think the thread had mostly come to good conclusions,
but the patch never made it into the kernel.

=
https://patchwork.ozlabs.org/project/linux-ext4/patch/4f8d5dc5b51a43efaf16=
c39398c23a6276e40a30.1386778303.git.dsterba@suse.cz/

One of those conclusions was that the kernel should always fill in the
fe_physical_length field in the returned extent, and set a flag:

#define FIEMAP_EXTENT_PHYS_LENGTH      0x00000010

to indicate to userspace that the physical length field is valid.

There should also be a separate flag for extents that are compressed:

#define FIEMAP_EXTENT_DATA_COMPRESSED  0x00000040

Rename fe_length to fe_logical_length and #define fe_length =
fe_logical_length
so that it is more clear which field is which in the data structure, but
does not break compatibility.

I think this patch gets most of this right, except the presence of the
flags to indicate the PHYS_LENGTH and DATA_COMPRESSED state in the =
extent.

Cheers, Andreas

> [1] https://github.com/kilobyte/compsize
>=20
> Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
> ---
> Documentation/filesystems/fiemap.rst | 26 ++++++++++++++++++--------
> fs/ioctl.c                           |  1 +
> include/uapi/linux/fiemap.h          | 24 +++++++++++++++++-------
> 3 files changed, 36 insertions(+), 15 deletions(-)
>=20
> diff --git a/Documentation/filesystems/fiemap.rst =
b/Documentation/filesystems/fiemap.rst
> index 93fc96f760aa..e3e84573b087 100644
> --- a/Documentation/filesystems/fiemap.rst
> +++ b/Documentation/filesystems/fiemap.rst
> @@ -80,14 +80,24 @@ Each extent is described by a single fiemap_extent =
structure as
> returned in fm_extents::
>=20
>     struct fiemap_extent {
> -	    __u64	fe_logical;  /* logical offset in bytes for the =
start of
> -				* the extent */
> -	    __u64	fe_physical; /* physical offset in bytes for the =
start
> -				* of the extent */
> -	    __u64	fe_length;   /* length in bytes for the extent =
*/
> -	    __u64	fe_reserved64[2];
> -	    __u32	fe_flags;    /* FIEMAP_EXTENT_* flags for this =
extent */
> -	    __u32	fe_reserved[3];
> +            /*
> +             * logical offset in bytes for the start of
> +             * the extent from the beginning of the file
> +             */
> +            __u64 fe_logical;
> +            /*
> +             * physical offset in bytes for the start
> +             * of the extent from the beginning of the disk
> +             */
> +            __u64 fe_physical;
> +            /* length in bytes for this extent */
> +            __u64 fe_length;
> +            /* physical length in bytes for this extent */
> +            __u64 fe_physical_length;
> +            __u64 fe_reserved64[1];
> +            /* FIEMAP_EXTENT_* flags for this extent */
> +            __u32 fe_flags;
> +            __u32 fe_reserved[3];
>     };
>=20
> All offsets and lengths are in bytes and mirror those on disk.  It is =
valid
> diff --git a/fs/ioctl.c b/fs/ioctl.c
> index 1d5abfdf0f22..f8e5d6dfc62d 100644
> --- a/fs/ioctl.c
> +++ b/fs/ioctl.c
> @@ -139,6 +139,7 @@ int fiemap_fill_next_extent(struct =
fiemap_extent_info *fieinfo, u64 logical,
> 	extent.fe_logical =3D logical;
> 	extent.fe_physical =3D phys;
> 	extent.fe_length =3D len;
> +	extent.fe_physical_length =3D len;
> 	extent.fe_flags =3D flags;
>=20
> 	dest +=3D fieinfo->fi_extents_mapped;
> diff --git a/include/uapi/linux/fiemap.h b/include/uapi/linux/fiemap.h
> index 24ca0c00cae3..fd3c7d380666 100644
> --- a/include/uapi/linux/fiemap.h
> +++ b/include/uapi/linux/fiemap.h
> @@ -15,13 +15,23 @@
> #include <linux/types.h>
>=20
> struct fiemap_extent {
> -	__u64 fe_logical;  /* logical offset in bytes for the start of
> -			    * the extent from the beginning of the file =
*/
> -	__u64 fe_physical; /* physical offset in bytes for the start
> -			    * of the extent from the beginning of the =
disk */
> -	__u64 fe_length;   /* length in bytes for this extent */
> -	__u64 fe_reserved64[2];
> -	__u32 fe_flags;    /* FIEMAP_EXTENT_* flags for this extent */
> +	/*
> +	 * logical offset in bytes for the start of
> +	 * the extent from the beginning of the file
> +	 */
> +	__u64 fe_logical;
> +	/*
> +	 * physical offset in bytes for the start
> +	 * of the extent from the beginning of the disk
> +	 */
> +	__u64 fe_physical;
> +	/* length in bytes for this extent */
> +	__u64 fe_length;
> +	/* physical length in bytes for this extent */
> +	__u64 fe_physical_length;
> +	__u64 fe_reserved64[1];
> +	/* FIEMAP_EXTENT_* flags for this extent */
> +	__u32 fe_flags;
> 	__u32 fe_reserved[3];
> };
>=20
> --
> 2.44.0
>=20
>=20


Cheers, Andreas






--Apple-Mail=_0B942F10-F546-413C-AFD4-3D5B482470C1
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEEDb73u6ZejP5ZMprvcqXauRfMH+AFAmXvoCsACgkQcqXauRfM
H+ADrw/+IqVgAGJbtVo0A+Nnn5mi7kEp8aNx8/JUszvksrlE0q1ePkrgnikbX4Ma
u1yllA4aMDXpI/HqMbSc3IuT7aYoC7pWFbPHR///w9BvUHnTk7lMQO4aYRXJuyUZ
9YarzeWQLI88ZaU8gtNMZGNn9KWGcxQEyv2J2m4rpoYupHciVC9yb0L6yJuqEZWd
E9/3kqp5NeAQ2tiYFKxAJNlMeHhGOfoTP7sgPafqAzNtAemzsOX/ixFbx+of+hY2
XxKKeLZMNsslyLruBwXgUUVPtStDlS9qMrw3hgHK3BhNrkDbnBmAX/6trhzc4S1W
U1UiqYXl7BxRHJbIPQmfLInM7OTAU0xieCwohZ5Q2cg9sm41yjwMIOJkYJ/zh/l/
Ly8YHoxnKj9tNxQqkOoRqGJSqHHWCvax+8yoeA4ea9OczaowSMYJ4jMqyk7dWYFv
tnNC6RZ0bDMWgBuvnT2jNbfaxZRDjKaAbs2ixku8/9HKHH6sttQWVf8mFnEzAsNX
YH6Y+RLaJk1kH3uDWCnOulU02Qe8Gja4sMeOBXIB0PKxLjdKt+zFH3acrsqzJF4P
++BOzCq2WyBFgLmiWep8lBaFYjt0qkRNUFUaw/GU9j/mv/yJsksBHknDuZV1D776
Fcw2Uj3Mi24jzEkchKQN0NR5g51wm/cJDf02Kwg4mnYtl1++zag=
=Cbgk
-----END PGP SIGNATURE-----

--Apple-Mail=_0B942F10-F546-413C-AFD4-3D5B482470C1--

