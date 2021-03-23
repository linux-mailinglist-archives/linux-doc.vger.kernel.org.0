Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF81C3453BA
	for <lists+linux-doc@lfdr.de>; Tue, 23 Mar 2021 01:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbhCWAOW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 22 Mar 2021 20:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231349AbhCWAOG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Mar 2021 20:14:06 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E676C0613D8
        for <linux-doc@vger.kernel.org>; Mon, 22 Mar 2021 17:14:06 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id w37so24008069lfu.13
        for <linux-doc@vger.kernel.org>; Mon, 22 Mar 2021 17:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TIGZs9jCzlV0x2/zD28u6hnF9ziSX82ipPw1eAlhUAk=;
        b=NQ71vlDt19b2qIy3K62/rODvW/ipNZXPs54iaqoCcYgvr0ZoSYMPbU3vdVRzRslzc0
         paD44AWGk2fGxml9DqHSXpWchMulVtSjoazoJQCHqMqDiZQv3PQGaTav7G+EZ+/Yz0Ph
         +I/b57JKRKullcMz8vVJcYd0UwSmrTSWA4CeJdZBKpdTGzNd97/MAdsFkXxVZPhb3k+4
         9ZqfVflxIPxDAKr+2r/8JCbzty+q0w/uN+ytri4BJTYKvpQ7fCZjmce6o20eSEVn/bUJ
         Ik0/GtqeP0J9ZbJyd50mOg9CAXERLBgP8bORDoUzBiazlAWWJUCNW/Nya+XY3VMgqVqW
         H7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TIGZs9jCzlV0x2/zD28u6hnF9ziSX82ipPw1eAlhUAk=;
        b=GASNLzDpDMLP89LdfgaFDuicIEj2IWKVIOSf5888oc6uxyMawxJnxIv3WfOpzhFve5
         rwY63rTDtxcJE0PDNMiGbckXKPF3SPPUNW6oj3imUe/NVowKPAQgPJtxK0Zeuh0Zla4o
         NxOVHz4u9bY29q3PuH6PNY/hfQRacj6FRFf478O5KnGnRivZgpwp5Kq8Xm7qgzviMVHN
         I7+//EAyZyK+LlvNNaDzX7McX8parLWZUBd9zrXzm6TSB8FF8quae7igwksWc86oIle9
         KsPlLy0YREaBLKWjTonSiQLyJ1e8YS8UeXh33fhy7LTWU3xJwRwbEA3HYU021wwlYpZO
         gwhA==
X-Gm-Message-State: AOAM5312oOb/o3WIL1XcmpQo4xTBNU73ZSJ1Pp2JQmQiWwOJMVObwatX
        ilQbUN97SqxQ+AiatznbV8DHOMwCMxAvKaLQZTiQUQ==
X-Google-Smtp-Source: ABdhPJzjC3gk50Yb4Wr00pH4fD/9xfeZqVtXPShrjfrPIGPPmvrDVMK0gxGlsIriq6MtCniISI8bDCiz3gzLLpYfAU8=
X-Received: by 2002:a19:946:: with SMTP id 67mr1116146lfj.74.1616458443362;
 Mon, 22 Mar 2021 17:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210316204252.427806-1-mic@digikod.net> <20210316204252.427806-8-mic@digikod.net>
In-Reply-To: <20210316204252.427806-8-mic@digikod.net>
From:   Jann Horn <jannh@google.com>
Date:   Tue, 23 Mar 2021 01:13:36 +0100
Message-ID: <CAG48ez1arKO3uYzwng8fst-UHkcH6J7YzyHFN+vfXUT2=1HT+w@mail.gmail.com>
Subject: Re: [PATCH v30 07/12] landlock: Support filesystem access-control
To:     =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc:     James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Lutomirski <luto@amacapital.net>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Casey Schaufler <casey@schaufler-ca.com>,
        David Howells <dhowells@redhat.com>,
        Jeff Dike <jdike@addtoit.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Michael Kerrisk <mtk.manpages@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Shuah Khan <shuah@kernel.org>,
        Vincent Dagonneau <vincent.dagonneau@ssi.gouv.fr>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        Linux API <linux-api@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

 On Tue, Mar 16, 2021 at 9:43 PM Micka=C3=ABl Sala=C3=BCn <mic@digikod.net>=
 wrote:
> Using Landlock objects and ruleset, it is possible to tag inodes
> according to a process's domain.
[...]
> +static void release_inode(struct landlock_object *const object)
> +       __releases(object->lock)
> +{
> +       struct inode *const inode =3D object->underobj;
> +       struct super_block *sb;
> +
> +       if (!inode) {
> +               spin_unlock(&object->lock);
> +               return;
> +       }
> +
> +       /*
> +        * Protects against concurrent use by hook_sb_delete() of the ref=
erence
> +        * to the underlying inode.
> +        */
> +       object->underobj =3D NULL;
> +       /*
> +        * Makes sure that if the filesystem is concurrently unmounted,
> +        * hook_sb_delete() will wait for us to finish iput().
> +        */
> +       sb =3D inode->i_sb;
> +       atomic_long_inc(&landlock_superblock(sb)->inode_refs);
> +       spin_unlock(&object->lock);
> +       /*
> +        * Because object->underobj was not NULL, hook_sb_delete() and
> +        * get_inode_object() guarantee that it is safe to reset
> +        * landlock_inode(inode)->object while it is not NULL.  It is the=
refore
> +        * not necessary to lock inode->i_lock.
> +        */
> +       rcu_assign_pointer(landlock_inode(inode)->object, NULL);
> +       /*
> +        * Now, new rules can safely be tied to @inode with get_inode_obj=
ect().
> +        */
> +
> +       iput(inode);
> +       if (atomic_long_dec_and_test(&landlock_superblock(sb)->inode_refs=
))
> +               wake_up_var(&landlock_superblock(sb)->inode_refs);
> +}
[...]
> +static struct landlock_object *get_inode_object(struct inode *const inod=
e)
> +{
> +       struct landlock_object *object, *new_object;
> +       struct landlock_inode_security *inode_sec =3D landlock_inode(inod=
e);
> +
> +       rcu_read_lock();
> +retry:
> +       object =3D rcu_dereference(inode_sec->object);
> +       if (object) {
> +               if (likely(refcount_inc_not_zero(&object->usage))) {
> +                       rcu_read_unlock();
> +                       return object;
> +               }
> +               /*
> +                * We are racing with release_inode(), the object is goin=
g
> +                * away.  Wait for release_inode(), then retry.
> +                */
> +               spin_lock(&object->lock);
> +               spin_unlock(&object->lock);
> +               goto retry;
> +       }
> +       rcu_read_unlock();
> +
> +       /*
> +        * If there is no object tied to @inode, then create a new one (w=
ithout
> +        * holding any locks).
> +        */
> +       new_object =3D landlock_create_object(&landlock_fs_underops, inod=
e);
> +       if (IS_ERR(new_object))
> +               return new_object;
> +
> +       /* Protects against concurrent get_inode_object() calls. */
> +       spin_lock(&inode->i_lock);
> +       object =3D rcu_dereference_protected(inode_sec->object,
> +                       lockdep_is_held(&inode->i_lock));

rcu_dereference_protected() requires that inode_sec->object is not
concurrently changed, but I think another thread could call
get_inode_object() while we're in landlock_create_object(), and then
we could race with the NULL write in release_inode() here? (It
wouldn't actually be a UAF though because we're not actually accessing
`object` here.) Or am I missing a lock that prevents this?

In v28 this wasn't an issue because release_inode() was holding
inode->i_lock (and object->lock) during the NULL store; but in v29 and
this version the NULL store in release_inode() moved out of the locked
region. I think you could just move the NULL store in release_inode()
back up (and maybe add a comment explaining the locking rules for
landlock_inode(...)->object)?

(Or alternatively you could use rcu_dereference_raw() with a comment
explaining that the read pointer is only used to check for NULL-ness,
and that it is guaranteed that the pointer can't change if it is NULL
and we're holding the lock. But that'd be needlessly complicated, I
think.)


> +       if (unlikely(object)) {
> +               /* Someone else just created the object, bail out and ret=
ry. */
> +               spin_unlock(&inode->i_lock);
> +               kfree(new_object);
> +
> +               rcu_read_lock();
> +               goto retry;
> +       }
> +
> +       rcu_assign_pointer(inode_sec->object, new_object);
> +       /*
> +        * @inode will be released by hook_sb_delete() on its superblock
> +        * shutdown.
> +        */
> +       ihold(inode);
> +       spin_unlock(&inode->i_lock);
> +       return new_object;
> +}
