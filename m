Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5250AED0D5
	for <lists+linux-doc@lfdr.de>; Sat,  2 Nov 2019 23:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727227AbfKBWKa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 2 Nov 2019 18:10:30 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:34692 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727219AbfKBWKa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 2 Nov 2019 18:10:30 -0400
Received: by mail-yw1-f66.google.com with SMTP id z144so3914111ywd.1
        for <linux-doc@vger.kernel.org>; Sat, 02 Nov 2019 15:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a/y/UNWsWFAphECmr0SKpq/uUSIVYd2blpeaPLFHhBw=;
        b=heUXVQ4VgTO2ElG0gwd7XEzTo2CN6hCnU2BwMj5n6t4b0IWTHitB6uFFkGY0EwRr+J
         QzeSddu3NhLjytmiCRz81gR54305JeZxa4iJHjUf/oW3uEftSlC7P3BhNQq1TkY9s7c6
         Z3tOkQFsryaKooRNEBI927kcGnXx4EmX295Cv8V2u7mTFBwFMG8Ur6ZS7Z+W4HVf61mg
         vAV321FuHNBjpO5nLg0r/KIhhBxTYq1GkZWAQtbAH9MxFoxj7l3NdEeeZOFkFIpAVMVr
         MFPWeapVqOj60ExILuL5ZjoMmNcabvxXt1zlAp6u1vK9XuBGPWNRCPhb0VFOAh+7QCUU
         c0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a/y/UNWsWFAphECmr0SKpq/uUSIVYd2blpeaPLFHhBw=;
        b=A2MKUl95QTIo42QHHrBOcpgzarcRd9d1OB1EAs/VLl2Y3UHgSYI8cAuy0js4jtNBzX
         cch6lGcDkfByBXd4WA0mV9Y7jky2UNHys6zdJ1IsdQKGLpHFGhhs/I0FxrkeQPWj1GDS
         DE/Y4Ag4ihqTdkg+23Yqfum9s4zoKWoqdVl9gQ3N60GeJT7I3ooQoy2P3h6O37Agpy8a
         vdf6ZNz5bcbDyJDBEH2XTysILWx8yD/DFg1OEOr0AJKhYdEaOHOBEG9IDMnRCC0r95dj
         WGBPs6ROd+GlqQ0s+I+YSGRzg4+lHMwKIgsVnw83WHyfWx1SYNDaVpfAm9IkpQgoqmbW
         G2Rg==
X-Gm-Message-State: APjAAAXKOo2ZEB7LuXUAf4i16FrWTc6mtLYu8VbBI19ZDqyIJUiMob4v
        Gxgv/dphAaIGxvEW0nMOByybOmKjTJneJ/R7i2MV+w==
X-Google-Smtp-Source: APXvYqxINNb17LJVAwLl2mdJpih2iAqY6Ts1EsT3XUgN7FVa5da8FtQWRDFu1/Q1pN84nIHPSiNi6XxLe3W7pyY/XV4=
X-Received: by 2002:a81:8486:: with SMTP id u128mr14394653ywf.337.1572732628718;
 Sat, 02 Nov 2019 15:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191030100618.1.Ibf7a996e4a58e84f11eec910938cfc3f9159c5de@changeid>
 <20191030173758.GC693@sol.localdomain> <CAD=FV=Uzma+eSGG1S1Aq6s3QdMNh4J-c=g-5uhB=0XBtkAawcA@mail.gmail.com>
 <20191030190226.GD693@sol.localdomain> <20191030205745.GA216218@sol.localdomain>
 <CAD=FV=X6Q3QZaND-tfYr9mf-KYMeKFmJDca3ee-i9roWj+GHsQ@mail.gmail.com>
 <CAD=FV=URZX4t-TB2Ne8y5ZfeBGoyhsPZhcncQ0yPe3cRXi=1gw@mail.gmail.com>
 <20191101043620.GA703@sol.localdomain> <CABXOdTddU2Kn8hJyofAC9eofZHAA4ddBhjNXc8GwC5dm3beMZA@mail.gmail.com>
In-Reply-To: <CABXOdTddU2Kn8hJyofAC9eofZHAA4ddBhjNXc8GwC5dm3beMZA@mail.gmail.com>
From:   Guenter Roeck <groeck@google.com>
Date:   Sat, 2 Nov 2019 15:10:17 -0700
Message-ID: <CABXOdTeu3KdT=arT+AKAOiPPM0U45krUfmDx6NH5nmDZ0pPa=A@mail.gmail.com>
Subject: Re: [PATCH] Revert "ext4 crypto: fix to check feature status before
 get policy"
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Doug Anderson <dianders@chromium.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Chao Yu <chao@kernel.org>,
        Ryo Hashimoto <hashimoto@chromium.org>,
        Vadim Sukhomlinov <sukhomlinov@google.com>,
        Guenter Roeck <groeck@chromium.org>,
        Andrey Pronin <apronin@chromium.org>,
        linux-doc@vger.kernel.org,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Jonathan Corbet <corbet@lwn.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        linux-fscrypt@vger.kernel.org,
        linux-ext4 <linux-ext4@vger.kernel.org>,
        linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 1, 2019 at 11:17 AM Guenter Roeck <groeck@google.com> wrote:
[ ... ]
> > Ah, I think I found it:
> >
> > https://chromium.googlesource.com/chromiumos/overlays/chromiumos-overlay/+/2cbdedd5eca0a57d9596671a99da5fab8e60722b/sys-apps/upstart/files/upstart-1.2-dircrypto.patch
> >
> > The init process does EXT4_IOC_GET_ENCRYPTION_POLICY on /, and if the error is
> > EOPNOTSUPP, it skips creating the "dircrypto" keyring.  So then cryptohome can't
> > add keys later.  (Note the error message you got, "Error adding dircrypto key".)
> >
> > So it looks like the kernel patch broke both that and
> > ext4_dir_encryption_supported().
> >
>
> ext4_dir_encryption_supported() was already changed to use the sysfs
> file, and changing the upstart code to check the sysfs file does
> indeed fix the problem for good. I'll do some more tests and push the
> necessary changes into our code base if I don't hit some other issue.
>

This change is now in our code base:

https://chromium.googlesource.com/chromiumos/overlays/chromiumos-overlay/+/5c5b06fded399013b9cce3d504c3d968ee84ab8b

If the revert has not made it upstream, I would suggest to hold it off
for the time being. I'll do more testing next week, but as it looks
like it may no longer be needed, at least not from a Chrome OS
perspective.

Guenter
