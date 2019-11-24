Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DED45108129
	for <lists+linux-doc@lfdr.de>; Sun, 24 Nov 2019 01:02:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbfKXABi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 23 Nov 2019 19:01:38 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41932 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbfKXABh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 23 Nov 2019 19:01:37 -0500
Received: by mail-oi1-f194.google.com with SMTP id e9so9885000oif.8
        for <linux-doc@vger.kernel.org>; Sat, 23 Nov 2019 16:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=woOONoIQFVxkt21SOpo2EiodkEkWZhvsKLiAP/7iXdw=;
        b=cB5mwcAlEz5N8Q++7MtpoGtJMCRf5e2J4jWxSgD50GpgOzZ5H/55BmhN5W65ClZ7ee
         KUYiNXQEHMUCUuaObYkohxJf45HrExY6AikhGBLrDwzoXHy/Owg4zjMs7cmBJaKBSnvO
         YRUAQW8yEGTlQbQE8OXs+26ACEGSefijjB1ExjpFk3Kuh0RcQg1ZsL2zxABODygo7qrO
         G5d5GvJQytkMEHgbE+9/jECFUbQJIF3DdZRpKBrjxC4ge3/30U/hIYPkofX47wLu4mtM
         lbr3J+EysGgiLmB5cu1pU01YBzO/wI9Zs/lRmI0ffFUKRCJUkiFjsdE6ol1xxyzKIXgc
         PCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=woOONoIQFVxkt21SOpo2EiodkEkWZhvsKLiAP/7iXdw=;
        b=uOU9VHcCJ4m45TONhAC02HhZJmGycvm0xL870nBQyF8+1odPF5XdH/NlTjLuNG59to
         1OJf583LqE73ElHujiZUIA17PV/IP9op6/8Mdr6+5hVvOhlQJSzUx2GngL+mzCYldSxO
         zjYYP1P3vfWzcGavn0juj/EGxKpKxkLWgKRm2NjRA/EqqQr08AHsxygtdnAaMT8AdBdY
         vXOihaNwo6FdXbUfbBJ5No1TOFSiRnZ1Mb/oJfRwfSH+YSyM7wIQ639eK4wBXknejVMI
         xMBH2rbWCc4lsD/ifOHCfv7WQY043iby1xfgx3f9gKlCzFMGjKvpbk6o0yf4sJ+0IS3F
         AQAQ==
X-Gm-Message-State: APjAAAXdzxu2RZ/B8YZWt85zLTNojZAiwP57DcQ5trcYgtW9Sb5wUiaN
        lR+9B+83esnN+ZZzW/UPGEpIzHOuYqjsopP0d1SirQ==
X-Google-Smtp-Source: APXvYqwMQpTIvHFrlW8fxxu156JT9NnpWLhNt6g4BECKYFzkCkhExI2nDlsUnUUdocxvVDaoXp/LGEZ7AjZQO7co3+0=
X-Received: by 2002:a05:6808:1da:: with SMTP id x26mr18330976oic.149.1574553696828;
 Sat, 23 Nov 2019 16:01:36 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.21.9999.1911221842200.14532@viisi.sifive.com>
 <20191123092552.1438bc95@lwn.net> <alpine.DEB.2.21.9999.1911231523390.14532@viisi.sifive.com>
 <CAPcyv4hmagCVLCTYmmv0U8-YD5BEoQPV=wtm5hbp3MxqwZRQUA@mail.gmail.com> <alpine.DEB.2.21.9999.1911231546450.14532@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1911231546450.14532@viisi.sifive.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Sat, 23 Nov 2019 16:01:25 -0800
Message-ID: <CAPcyv4hBNfabaZmKs0XF+UT9Py8zJqpNdu5KsToqp305NASKNA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: riscv: add patch acceptance guidelines
To:     Paul Walmsley <paul.walmsley@sifive.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, krste@berkeley.edu,
        waterman@eecs.berkeley.edu,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Nov 23, 2019 at 3:50 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> On Sat, 23 Nov 2019, Dan Williams wrote:
>
> > On Sat, Nov 23, 2019 at 3:27 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
> >
> > > It looks like the main thing that would be needed would be to add the P:
> > > entry with the path to our patch-acceptance.rst file into the MAINTAINERS
> > > file, after Dan's patches are merged.
> > >
> > > Of course, we could also add more information about sparse cleanliness,
> > > checkpatch warnings, etc., but we mostly try to follow the common kernel
> > > guidelines there.
> >
> > Those could likely be automated to highlight warnings that a given
> > subsystem treats as errors, but wherever possible my expectation is
> > that the policy should be specified globally.
> >
> > > Is that summary accurate, or did I miss some additional steps?
> >
> > I'll go fixup and get the into patch submitted today then we can go from
> > there.
>
> I guess I'm still looking for guidance along the lines of my earlier
> question: what (if anything) would we need to change about the current
> patch to have it work with the maintainer profile documentation (beyond
> the "P:" entry in MAINTAINERS) ?

Oh, sorry, I just reacted to Jon's comments. I took a look, and I
think the content would just need to be organized into the proposed
sections. The rules about what level of ratification a specification
needs to receive before a patch will be received sounds like an
extension to the Submit Checklist to me. So I'd say just format your
first paragraph into the Overview section and the other 2 into Submit
Checklist and call it good.
