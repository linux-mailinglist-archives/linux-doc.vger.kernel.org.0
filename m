Return-Path: <linux-doc+bounces-10337-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 061CA85ED21
	for <lists+linux-doc@lfdr.de>; Thu, 22 Feb 2024 00:39:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 899A71F23764
	for <lists+linux-doc@lfdr.de>; Wed, 21 Feb 2024 23:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48D712C802;
	Wed, 21 Feb 2024 23:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="YPmVQ38K"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BC712A16B
	for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 23:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708558726; cv=none; b=TJtF00w8hxn2VK8g0I+/rlrvEij330lKfyJ7pMM5ojncyOL9judTdeu49m7tXrjKg/aRu0wlWm6FpT8qS0k0GtTtTZQfgjQJ2ODx/S0LqS2cj8A+QMf+R6j3VPoitDRL1uZR2Nlk7JeJRv5yRXSqB3tSTlUtswjAtSTOsxILV/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708558726; c=relaxed/simple;
	bh=VbnWhAoLr3EeawQyolNDrQRXZNQkuXxI4yM52Iy8tIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DFIEuG8fn9J7u3RSCfhTrbPmIfVNUHrF7YD+TkA9D5TxRirnUFKuojnnjUvhZRuxDKQ9sxNv4OkDvZZ4MlmF5/Az90u4P1pa6vwCKZRWv7Hp7em7Z3PsY65zIPXD39ExbkMx6j8WaeuNOkqD/s89gNZaTQ2fWUCBAEn2Tw61Gwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=YPmVQ38K; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcc4de7d901so6501217276.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 15:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1708558724; x=1709163524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdOxMAkyl5yi4MjXJFORjz39p90zOjZ6/27YgpZJWJY=;
        b=YPmVQ38KfNBCioWnQH9i31aCO3qWe8g4FexNNDFGDhqNeUuG3XWPmFpEmA9awwJb5A
         XJMx1A4m8+BVZ1p3XAzZC0zKg0x2+yDBARbViUOghFqUGf+dz8CsnJ5TtGF1E2scHF+n
         V6duZxQp4Ar9bMK4gSSNOGSTRmg+5RW72XtCgnbZaFQ2Fdd7MiWjHHmP4E3GtBuFibTP
         IgYgbe2K/n8oF+Bbf6blxarTZldQ732ran3ZxPn05Tb9kRx/ux++hkqS0FRC2yAvwcXG
         pXLxyhQUGJkLQbYP71i9C14lJBPG5F27nJWtaJSiNcmk2DhBaP2K5piPo2wLFuE4tLYA
         p1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708558724; x=1709163524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdOxMAkyl5yi4MjXJFORjz39p90zOjZ6/27YgpZJWJY=;
        b=akROjWIF2nVNBmZlKYVxQYfUSFsCbehfBxVDZ4SlwBtqoQsJbOYF2ZOPJ34guWT1ii
         GA5FHrgx93Itl36GbsfrzftE7UI8cnga+6I0XpC8jJx13kmyBztI6w/3pAMCF2N53J90
         XQN9rki/OYngoX9siQVixngxjcWYysjx550tCwYb5rzv7LZPtJq3ugHEnyHyCfKZy5xF
         Ih9SF+9mN9jmAwkWESnQVKHwnikQbB7kvFaTQfcwWWcvNR4JJYzAp3SK09BHdXPlaIyd
         PnReGIIiJPekyBYVXBhfntyojGkAsiuS4fguHkAzytZbU0XyfB1Bv4ip7+24bfq7a2B9
         7fDg==
X-Forwarded-Encrypted: i=1; AJvYcCXvoMHgHdYeoprdKg4hIK9RLEYNBgoiNQQ9O9eFtPKwFm/xn9EQClSLGeDQJek9mrCGQobZhxqnbXR65kqw+v5EE75LYI2y2zHZ
X-Gm-Message-State: AOJu0Yw8ZI7gscmj0JqvGhQcjLriBHdtcpCGfKsBbSIEq2FMUDTHKD+f
	HMQI3/6wcc+Z9pLEjieEv7vYocr0mDFTWu1Jdv0Q/4Z+qh6QZ/sujgR0ohf9H1px3HNUTJfQVwB
	xNsCoR6JD9FvtDg4ztI0JT2EeLbt7hyW64KTq
X-Google-Smtp-Source: AGHT+IHA2xpXRb1sDUe9q9FIIpvonGFzRGzz6GZyMO19EZeTrYiVFDtuhUjox8KLin5Elu441vcMmgEKrRzPPcEqg0U=
X-Received: by 2002:a5b:c85:0:b0:dc6:d2d3:a57c with SMTP id
 i5-20020a5b0c85000000b00dc6d2d3a57cmr742866ybq.59.1708558723714; Wed, 21 Feb
 2024 15:38:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221-idmap-fscap-refactor-v2-0-3039364623bd@kernel.org> <20240221-idmap-fscap-refactor-v2-12-3039364623bd@kernel.org>
In-Reply-To: <20240221-idmap-fscap-refactor-v2-12-3039364623bd@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 21 Feb 2024 18:38:33 -0500
Message-ID: <CAHC9VhTgHP=3Te4=t6chGte15CA_tMoVjFuzBwh+FxQ6Ri4mQQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/25] selinux: add hooks for fscaps operations
To: "Seth Forshee (DigitalOcean)" <sforshee@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Serge Hallyn <serge@hallyn.com>, Eric Paris <eparis@redhat.com>, 
	James Morris <jmorris@namei.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Casey Schaufler <casey@schaufler-ca.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Jonathan Corbet <corbet@lwn.net>, Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, audit@vger.kernel.org, 
	selinux@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 4:25=E2=80=AFPM Seth Forshee (DigitalOcean)
<sforshee@kernel.org> wrote:
>
> Add hooks for set/get/remove fscaps operations which perform the same
> checks as the xattr hooks would have done for XATTR_NAME_CAPS.
>
> Signed-off-by: Seth Forshee (DigitalOcean) <sforshee@kernel.org>
> ---
>  security/selinux/hooks.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index a6bf90ace84c..da129a387b34 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -3367,6 +3367,29 @@ static int selinux_inode_removexattr(struct mnt_id=
map *idmap,
>         return -EACCES;
>  }
>
> +static int selinux_inode_set_fscaps(struct mnt_idmap *idmap,
> +                                   struct dentry *dentry,
> +                                   const struct vfs_caps *caps, int flag=
s)
> +{
> +       return dentry_has_perm(current_cred(), dentry, FILE__SETATTR);
> +}

The selinux_inode_setxattr() code also has a cap_inode_setxattr()
check which is missing here.  Unless you are handling this somewhere
else, I would expect the function above to look similar to
selinux_inode_remove_fscaps(), but obviously tweaked for setting the
fscaps and not removing them.

> +static int selinux_inode_get_fscaps(struct mnt_idmap *idmap,
> +                                   struct dentry *dentry)
> +{
> +       return dentry_has_perm(current_cred(), dentry, FILE__GETATTR);
> +}
> +
> +static int selinux_inode_remove_fscaps(struct mnt_idmap *idmap,
> +                                      struct dentry *dentry)
> +{
> +       int rc =3D cap_inode_removexattr(idmap, dentry, XATTR_NAME_CAPS);
> +       if (rc)
> +               return rc;
> +
> +       return dentry_has_perm(current_cred(), dentry, FILE__SETATTR);
> +}
> +
>  static int selinux_path_notify(const struct path *path, u64 mask,
>                                                 unsigned int obj_type)
>  {
> @@ -7165,6 +7188,9 @@ static struct security_hook_list selinux_hooks[] __=
ro_after_init =3D {
>         LSM_HOOK_INIT(inode_set_acl, selinux_inode_set_acl),
>         LSM_HOOK_INIT(inode_get_acl, selinux_inode_get_acl),
>         LSM_HOOK_INIT(inode_remove_acl, selinux_inode_remove_acl),
> +       LSM_HOOK_INIT(inode_set_fscaps, selinux_inode_set_fscaps),
> +       LSM_HOOK_INIT(inode_get_fscaps, selinux_inode_get_fscaps),
> +       LSM_HOOK_INIT(inode_remove_fscaps, selinux_inode_remove_fscaps),
>         LSM_HOOK_INIT(inode_getsecurity, selinux_inode_getsecurity),
>         LSM_HOOK_INIT(inode_setsecurity, selinux_inode_setsecurity),
>         LSM_HOOK_INIT(inode_listsecurity, selinux_inode_listsecurity),
>
> --
> 2.43.0

--=20
paul-moore.com

