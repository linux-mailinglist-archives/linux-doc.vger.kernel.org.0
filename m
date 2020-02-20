Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6F7916550B
	for <lists+linux-doc@lfdr.de>; Thu, 20 Feb 2020 03:27:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbgBTC1e (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 19 Feb 2020 21:27:34 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41573 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727291AbgBTC1c (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Feb 2020 21:27:32 -0500
Received: by mail-lf1-f68.google.com with SMTP id m30so1763872lfp.8
        for <linux-doc@vger.kernel.org>; Wed, 19 Feb 2020 18:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6R9oDs43e49OHId2T3Say1GnAm1Sa9Cij9vjtGqns0w=;
        b=HuesXzqrMwl5FNOeLlSDpflwNsgmCskzweQrWPKSAAxSCw7lHW66AFscJTMdsIwTfM
         jGiq6RpnOPaB5Oyh2lOyEHyuTv6NINI8z9tC0O74kkXNN/1S0DYEYEQUa8h2V/dm0VDo
         keHC2RRk+b6r2swD/RwtYXIMxjyjo6GlOu9gB+dUg2p6qefC+T1P4UZIm91Uo85LA+Rv
         8G03jtGxUTJfvgq8RG9MYFoubld2O9BsSsn+sfVhyCNC5XE59suWdHa3oI9hlsR9Dp3B
         GPuDBZymMhE77jVkDqjzwPoCAdP4mi7yBzI9bHOB2pq77Qnr4eN2rvsvew1j0jZvfkPA
         bB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6R9oDs43e49OHId2T3Say1GnAm1Sa9Cij9vjtGqns0w=;
        b=mUpiRgwt63B3NUQON42p3L24pGA1TCPNlvmJDjWpEO4Vzn6UTkYyMwEPYgPHTJiYcH
         ijnJ6GFxb7bjD2cjyQA4bo1+fDneNSpwHVOJrCzZvbs9dv4Sf3I85CLkDsefq4bIquDx
         G1qskMJlfe3MU2/oKKgism7q4xaVp9rj2S6UH5aIp4kEMrOLINMr9lk8h83UT+DgZ3FP
         688VdA47WK4SVKX9on55I3KFnR6nkpj3dUANwPJ4rQrlVMh/Y/xmLjlrfzWVu/P6s2f3
         fks+ySpqW7o6bmltkU+JC8GP6ZIYQOfjFFbucrzjXo21hkyf1KtAezCA9sDuN29mXMMm
         2PMg==
X-Gm-Message-State: APjAAAVZZYXwmWgsoBaq2tB5MZLN9m/xOdC42owOWlE8DqHjsxStz3WG
        EwsE4nmFn3StWa64UpI3r+LD1fzLPMCZr9IuxHceoA==
X-Google-Smtp-Source: APXvYqxXpLX+dEvOT5j7tpgmTqUeHQ8fFVlo3960ntu34jaP3dDFM5jPLMUuGTmSmVlcfqf9AGyYlOtPMi7izdaPUmg=
X-Received: by 2002:ac2:5979:: with SMTP id h25mr15671398lfp.203.1582165648799;
 Wed, 19 Feb 2020 18:27:28 -0800 (PST)
MIME-Version: 1.0
References: <20200208013552.241832-1-drosen@google.com> <20200208013552.241832-3-drosen@google.com>
 <20200208021216.GE23230@ZenIV.linux.org.uk> <CA+PiJmTYbEA-hgrKwtp0jZXqsfYrzgogOZ0Pt=gTCtqhBfnqFA@mail.gmail.com>
 <20200210234207.GJ23230@ZenIV.linux.org.uk> <20200212063440.GL870@sol.localdomain>
 <20200212065734.GA157327@sol.localdomain>
In-Reply-To: <20200212065734.GA157327@sol.localdomain>
From:   Daniel Rosenberg <drosen@google.com>
Date:   Wed, 19 Feb 2020 18:27:17 -0800
Message-ID: <CA+PiJmRX1tBVqdAgHwk62rGqEQg28B3j5mEsaDBm3UV9_fzDEQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/8] fs: Add standard casefolding support
To:     Eric Biggers <ebiggers@kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Gabriel Krisman Bertazi <krisman@collabora.com>
Cc:     "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org,
        Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
        linux-f2fs-devel@lists.sourceforge.net,
        linux-fscrypt@vger.kernel.org, Richard Weinberger <richard@nod.at>,
        linux-mtd@lists.infradead.org,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 11, 2020 at 10:57 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> Or (just throwing another idea out there) the dentry's name could be copied to a
> temporary buffer in ->d_compare().  The simplest version would be:
>
>         u8 _name[NAME_MAX];
>
>         memcpy(_name, name, len);
>         name = _name;
>
> Though, 255 bytes is a bit large for a stack buffer (so for long names it may
> need kmalloc with GFP_ATOMIC), and technically it would need a special version
> of memcpy() to be guaranteed safe from compiler optimizations (though I expect
> this would work in practice).
>
> Alternatively, take_dentry_name_snapshot() kind of does this already, except
> that it takes a dentry and not a (name, len) pair.
>
> - Eric

If we want to use take_dentry_name_snapshot, we'd need to do it before
calling the dentry op, since we get the dentry as a const. It would do
exactly what we want, in that it either takes a reference on the long
name, or copies the short name, although it does so under a spinlock.
I'm guessing we don't want to add that overhead for all
d_compare/d_hash's. I suppose it could just take a snapshot if it
falls under needs_casefold, but that feels a bit silly to me.

i don't think utf8cursor/utf8byte could be modified to be RCU safe
apart from a copy. As part of normalization there's some sorting that
goes on to ensure that different encodings of the same characters can
be matched, and I think those can technically be arbitrarily long, so
we'd possibly end up needing the copy anyways.

So, I see two possible fixes.
1. Use take_dentry_name_snapshot along the RCU paths to calling d_hash
and d_compare, at least when needs_casefold is true.
2. Within d_hash/d_compare, create a copy of the name if it is a short name.

For 1, it adds some overhead in general, which I'm sure we'd want to avoid.
For 2, I don't think we know we're in RCU mode, so we'd need to always
copy short filenames. I'm also unsure if it's valid to assume that
name given is stable if it is not the same as dentry->d_iname. If it
is, we only need to worry about copying DNAME_INLINE_LEN bytes at max
there. For memcpy, is there a different version that we'd want to use
for option 2?

-Daniel
