Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16004377470
	for <lists+linux-doc@lfdr.de>; Sun,  9 May 2021 00:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbhEHWtj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 8 May 2021 18:49:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhEHWtj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 8 May 2021 18:49:39 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DECA1C061574
        for <linux-doc@vger.kernel.org>; Sat,  8 May 2021 15:48:36 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id c11so17908699lfi.9
        for <linux-doc@vger.kernel.org>; Sat, 08 May 2021 15:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0kA/KDUDO096vq2rEKxFXAZivI52axFruzSdRkQyvoI=;
        b=PWRMIeUKO0nmSZhexye/3YzAUVpInwAh7XXlaTHnWhlKIAuWvggExHJgbfmaYh9nR0
         DRNpc5CAKtPEke/TFa5iaD4eYxQPerPxY17lVXLaNXY4SEls6TLdUjya9c5Rt62dxKkG
         IgPGuzEDzfaGsPkyXdCfqJY1xki5yy39Ae+Yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0kA/KDUDO096vq2rEKxFXAZivI52axFruzSdRkQyvoI=;
        b=Xla1niBoh4HXBheEXc4lF8fRj71gbXNOSZNw7a8u9ml4D/mN1m+l6lDb/DEVntg/m4
         HHqZaaj/gCuwuGmqLyQRZ7xyyk/pGCcdRVK9xcbQfXij9qm16xFt1WKnxngfOSK+saa5
         LC+meDwYquhdHD/LnEOoX/sCs7hWxkqApXwdY4nYdVdRNtIMUDOchPQAph5u0SGsnAL8
         c3z+DmIM6PGG0/k0wb966jujHPs2EcukWnu5mClfxxQUpjh9RhXJdkNotDI8ONhcftiV
         gnlbK7Qc/sbfIZ+Btsp/gcTjT075/W0seUG5aqTcncX2MlUrgSyyX33MD7GiZwWGSUn0
         x9zw==
X-Gm-Message-State: AOAM533qTonU15BC6i0uavaQUzW35YWflVr7femRalHrC5iT7cjojYU+
        4s+Qz3+cGscsC5sGxL+3YjDXz3hf7FuJ+GnPQFU=
X-Google-Smtp-Source: ABdhPJz+LSWXhprzyyHG80yJFZbnkCFlOTsunHyDiH96objbmfpQk+87v3hFEcyEaQ6QMfVSJdo1UA==
X-Received: by 2002:ac2:43ac:: with SMTP id t12mr11317359lfl.258.1620514115306;
        Sat, 08 May 2021 15:48:35 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id p20sm2496217ljn.86.2021.05.08.15.48.34
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 May 2021 15:48:34 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id c11so17908659lfi.9
        for <linux-doc@vger.kernel.org>; Sat, 08 May 2021 15:48:34 -0700 (PDT)
X-Received: by 2002:ac2:5e6e:: with SMTP id a14mr10896192lfr.201.1620514114222;
 Sat, 08 May 2021 15:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210508122530.1971-1-justin.he@arm.com> <20210508122530.1971-2-justin.he@arm.com>
 <CAHk-=wgSFUUWJKW1DXa67A0DXVzQ+OATwnC3FCwhqfTJZsvj1A@mail.gmail.com>
 <YJbivrA4Awp4FXo8@zeniv-ca.linux.org.uk> <CAHk-=whZhNXiOGgw8mXG+PTpGvxnRG1v5_GjtjHpoYXd2Fn_Ow@mail.gmail.com>
 <YJb9KFBO7MwJeDHz@zeniv-ca.linux.org.uk> <CAHk-=wjgXvy9EoE1_8KpxE9P3J_a-NF7xRKaUzi9MPSCmYnq+Q@mail.gmail.com>
 <YJcUvwo2pn0JEs27@zeniv-ca.linux.org.uk>
In-Reply-To: <YJcUvwo2pn0JEs27@zeniv-ca.linux.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 8 May 2021 15:48:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgbaLFNU3448HhUX7AZB1xxqTg=A8PLbzazQxR_ukyJsw@mail.gmail.com>
Message-ID: <CAHk-=wgbaLFNU3448HhUX7AZB1xxqTg=A8PLbzazQxR_ukyJsw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] fs: introduce helper d_path_fast()
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Jia He <justin.he@arm.com>, Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Al Viro <viro@ftp.linux.org.uk>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        "Darrick J. Wong" <darrick.wong@oracle.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Ira Weiny <ira.weiny@intel.com>,
        Eric Biggers <ebiggers@google.com>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, May 8, 2021 at 3:46 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> static inline struct mount *real_mount(struct vfsmount *mnt)
> {
>         return container_of(mnt, struct mount, mnt);

Too subtle for me indeed.

           Linus
