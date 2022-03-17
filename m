Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73CD74DBC5B
	for <lists+linux-doc@lfdr.de>; Thu, 17 Mar 2022 02:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242485AbiCQB1g (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 16 Mar 2022 21:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbiCQB1g (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Mar 2022 21:27:36 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4EE91DA6B
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 18:26:20 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id hw13so7658264ejc.9
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 18:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LgV0fd+BwTbg7RPyItVYlkUF0L+G2JNvxHK98uutjq8=;
        b=JO1KCJzGLyWUg+CcEOyBJkeMyoi+vIaQI14wNzjfXi1lAp2PKNTGC/c7IqNotADydK
         JX9qKj0RuPxPp5mKMrDIXRbRIzi8KLu5s23Z4IG8O/6CFH9ilcrq+goVjn0+QBOEfcFX
         6u0so/mdr8g/iCsIMqkikbXLqC70pRU7Njs8OrviG9h6dKamlLqEc/lBSzmeB+X28yD8
         SS0LWuxioyIXGElOMrMf1XfZs84rwRYEBEo8PAcz5EEj6MbpDCyrfFJiT18pCyKso31s
         j66xTtcav3dWJtPBm+U9Yn/l1dEOIhXXPbLBhB4t2CgOBipaZOwE2wxGbjL9IW+v7jGB
         liJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LgV0fd+BwTbg7RPyItVYlkUF0L+G2JNvxHK98uutjq8=;
        b=GlGLReBmi5t9xoB0j9zrnrv5N1hd6Z4WCuxiRBDYmpZK75SHb6JTXYHGRcXDvyiENn
         NjZyuvAeeDvubWZ4AonNPTf+E/ZiLlht4+8b6lXkPOdgYzVXLuoeTJghOkZPLjdrQ0wu
         3S2up4nxYqVqFZCWHAtMBmVdDWRE2qxm2psHtuSkxrQUHcs8gefMcuB3nkPq6113q651
         PAVNhGJ9DG5nO6g4gCpA/Z/XMpWDNVmLml17jkhGM7sp3DPrH6s243h7/N7z+k20YA9H
         hziphPxpwRvDBFydhONdzTyuxjEdtKRZ3sqs1lKKvpP7OiWsDdUd+buTf9W6W2PY9xs4
         APRA==
X-Gm-Message-State: AOAM531ZKBTHb6ROntDG1UESffVdsBihAwx6NxKGuraoB3bY8fVGUQGl
        afgnkTXLBbd3YK8Wkwd+GYoxDcrkst52DNGCO3d/
X-Google-Smtp-Source: ABdhPJz6fiEEFi+Q35JiW3eZl06su1XRmZErVn79mSPE8R2VXQXUbM6SSUcQ/vlKwDD/wXijrtbrvgqXR12FWRfxars=
X-Received: by 2002:a17:907:3f86:b0:6db:b745:f761 with SMTP id
 hr6-20020a1709073f8600b006dbb745f761mr2168517ejc.610.1647480379164; Wed, 16
 Mar 2022 18:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220221212522.320243-1-mic@digikod.net> <20220221212522.320243-2-mic@digikod.net>
In-Reply-To: <20220221212522.320243-2-mic@digikod.net>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 16 Mar 2022 21:26:08 -0400
Message-ID: <CAHC9VhQEEKGgCn7fYgUt-_WhXc-vrKq9TVm=cfwJUyWaUgY2Vw@mail.gmail.com>
Subject: Re: [PATCH v1 01/11] landlock: Define access_mask_t to enforce a
 consistent access mask size
To:     =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc:     James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jann Horn <jannh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Konstantin Meskhidze <konstantin.meskhidze@huawei.com>,
        Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 21, 2022 at 4:15 PM Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> =
wrote:
>
> From: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
>
> Create and use the access_mask_t typedef to enforce a consistent access
> mask size and uniformly use a 16-bits type.  This will helps transition
> to a 32-bits value one day.
>
> Add a build check to make sure all (filesystem) access rights fit in.
> This will be extended with a following commit.
>
> Signed-off-by: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
> Link: https://lore.kernel.org/r/20220221212522.320243-2-mic@digikod.net
> ---
>  security/landlock/fs.c      | 19 ++++++++++---------
>  security/landlock/fs.h      |  2 +-
>  security/landlock/limits.h  |  2 ++
>  security/landlock/ruleset.c |  6 ++++--
>  security/landlock/ruleset.h | 17 +++++++++++++----
>  5 files changed, 30 insertions(+), 16 deletions(-)
>
> diff --git a/security/landlock/fs.c b/security/landlock/fs.c
> index 97b8e421f617..9de2a460a762 100644
> --- a/security/landlock/fs.c
> +++ b/security/landlock/fs.c
> @@ -150,7 +150,7 @@ static struct landlock_object *get_inode_object(struc=
t inode *const inode)
>   * @path: Should have been checked by get_path_from_fd().
>   */
>  int landlock_append_fs_rule(struct landlock_ruleset *const ruleset,
> -               const struct path *const path, u32 access_rights)
> +               const struct path *const path, access_mask_t access_right=
s)
>  {
>         int err;
>         struct landlock_object *object;
> @@ -182,8 +182,8 @@ int landlock_append_fs_rule(struct landlock_ruleset *=
const ruleset,
>
>  static inline u64 unmask_layers(
>                 const struct landlock_ruleset *const domain,
> -               const struct path *const path, const u32 access_request,
> -               u64 layer_mask)
> +               const struct path *const path,
> +               const access_mask_t access_request, u64 layer_mask)
>  {
>         const struct landlock_rule *rule;
>         const struct inode *inode;
> @@ -223,7 +223,8 @@ static inline u64 unmask_layers(
>  }
>
>  static int check_access_path(const struct landlock_ruleset *const domain=
,
> -               const struct path *const path, u32 access_request)
> +               const struct path *const path,
> +               const access_mask_t access_request)
>  {
>         bool allowed =3D false;
>         struct path walker_path;
> @@ -308,7 +309,7 @@ static int check_access_path(const struct landlock_ru=
leset *const domain,
>  }
>
>  static inline int current_check_access_path(const struct path *const pat=
h,
> -               const u32 access_request)
> +               const access_mask_t access_request)
>  {
>         const struct landlock_ruleset *const dom =3D
>                 landlock_get_current_domain();
> @@ -511,7 +512,7 @@ static int hook_sb_pivotroot(const struct path *const=
 old_path,
>
>  /* Path hooks */
>
> -static inline u32 get_mode_access(const umode_t mode)
> +static inline access_mask_t get_mode_access(const umode_t mode)
>  {
>         switch (mode & S_IFMT) {
>         case S_IFLNK:
> @@ -563,7 +564,7 @@ static int hook_path_link(struct dentry *const old_de=
ntry,
>                         get_mode_access(d_backing_inode(old_dentry)->i_mo=
de));
>  }
>
> -static inline u32 maybe_remove(const struct dentry *const dentry)
> +static inline access_mask_t maybe_remove(const struct dentry *const dent=
ry)
>  {
>         if (d_is_negative(dentry))
>                 return 0;
> @@ -631,9 +632,9 @@ static int hook_path_rmdir(const struct path *const d=
ir,
>
>  /* File hooks */
>
> -static inline u32 get_file_access(const struct file *const file)
> +static inline access_mask_t get_file_access(const struct file *const fil=
e)
>  {
> -       u32 access =3D 0;
> +       access_mask_t access =3D 0;
>
>         if (file->f_mode & FMODE_READ) {
>                 /* A directory can only be opened in read mode. */
> diff --git a/security/landlock/fs.h b/security/landlock/fs.h
> index 187284b421c9..74be312aad96 100644
> --- a/security/landlock/fs.h
> +++ b/security/landlock/fs.h
> @@ -65,6 +65,6 @@ static inline struct landlock_superblock_security *land=
lock_superblock(
>  __init void landlock_add_fs_hooks(void);
>
>  int landlock_append_fs_rule(struct landlock_ruleset *const ruleset,
> -               const struct path *const path, u32 access_hierarchy);
> +               const struct path *const path, access_mask_t access_hiera=
rchy);
>
>  #endif /* _SECURITY_LANDLOCK_FS_H */
> diff --git a/security/landlock/limits.h b/security/landlock/limits.h
> index 2a0a1095ee27..458d1de32ed5 100644
> --- a/security/landlock/limits.h
> +++ b/security/landlock/limits.h
> @@ -9,6 +9,7 @@
>  #ifndef _SECURITY_LANDLOCK_LIMITS_H
>  #define _SECURITY_LANDLOCK_LIMITS_H
>
> +#include <linux/bitops.h>
>  #include <linux/limits.h>
>  #include <uapi/linux/landlock.h>
>
> @@ -17,5 +18,6 @@
>
>  #define LANDLOCK_LAST_ACCESS_FS                LANDLOCK_ACCESS_FS_MAKE_S=
YM
>  #define LANDLOCK_MASK_ACCESS_FS                ((LANDLOCK_LAST_ACCESS_FS=
 << 1) - 1)
> +#define LANDLOCK_NUM_ACCESS_FS         __const_hweight64(LANDLOCK_MASK_A=
CCESS_FS)

The line above, and the static_assert() in ruleset.h are clever.  I'll
admit I didn't even know the hweightX() macros existed until looking
at this code :)

However, the LANDLOCK_NUM_ACCESS_FS is never really going to be used
outside the static_assert() in ruleset.h is it?  I wonder if it would
be better to skip the extra macro and rewrite the static_assert like
this:

static_assert(BITS_PER_TYPE(access_mask_t) >=3D
__const_hweight64(LANDLOCK_MASK_ACCESS_FS));

If not, I might suggest changing LANDLOCK_NUM_ACCESS_FS to
LANDLOCK_BITS_ACCESS_FS or something similar.


> diff --git a/security/landlock/ruleset.h b/security/landlock/ruleset.h
> index 2d3ed7ec5a0a..7e7cac68e443 100644
> --- a/security/landlock/ruleset.h
> +++ b/security/landlock/ruleset.h
> @@ -9,13 +9,20 @@
>  #ifndef _SECURITY_LANDLOCK_RULESET_H
>  #define _SECURITY_LANDLOCK_RULESET_H
>
> +#include <linux/bitops.h>
> +#include <linux/build_bug.h>
>  #include <linux/mutex.h>
>  #include <linux/rbtree.h>
>  #include <linux/refcount.h>
>  #include <linux/workqueue.h>
>
> +#include "limits.h"
>  #include "object.h"
>
> +typedef u16 access_mask_t;
> +/* Makes sure all filesystem access rights can be stored. */
> +static_assert(BITS_PER_TYPE(access_mask_t) >=3D LANDLOCK_NUM_ACCESS_FS);

--
paul-moore.com
