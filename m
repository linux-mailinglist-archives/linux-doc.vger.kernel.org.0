Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B586B1086CB
	for <lists+linux-doc@lfdr.de>; Mon, 25 Nov 2019 04:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfKYDUu (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 24 Nov 2019 22:20:50 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37952 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726945AbfKYDUu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Nov 2019 22:20:50 -0500
Received: by mail-ot1-f65.google.com with SMTP id z25so11324653oti.5
        for <linux-doc@vger.kernel.org>; Sun, 24 Nov 2019 19:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=72RpSXa/41GCFQnbzlHwP1dZ5nMfYcHZnOpPX9qfEw4=;
        b=FnZ8CuB8Jaav0sZ6IeBLdo0S0pFI6uWktcnFrPh76h3EjcLbUNcef2Oj+ZbeFs8z1i
         IPi1wxSBMPSRHu9zUwmhGZXvDYWlkCpdBJqX9fKQ0oJ24/JAqR9Tnq/ZwwFcrJq2cbze
         RVKynrxQH9feuMHYYhtEeuUvHZs7uGuKLyIaRVMF63rDPw2r2rfgX8hKi234kwQpCj9I
         g+RMn63vlr7Lyo08UsgHp7j/Cu3Qt2kn1ahGy/vO9U9ImJ2jJHSB6xTOOuYLwPOm5+To
         ySOTW8i0jngrZ8BKN7ZKhYVRC3f5Fwj4vBQXEalsLB9uk+TCkoHw4oR5LHOAqdIUyZVS
         O6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=72RpSXa/41GCFQnbzlHwP1dZ5nMfYcHZnOpPX9qfEw4=;
        b=Hl+L25R7wqjVmoZPfqy/rhaMdo7g7T11a6YVWJftDz06XAXxh/w6n8zxveVahf+Qce
         2Sp5uDE7Igwf46kgTEjHapclVYIWFdM5MOqiE50YDRyRzq5f59Ri7uJ4RWH1V5kRvL9s
         o+bXlh66NijBNTTrdpj1WDCyV05hOICFC0zjYcAEoxArQzG7vm2CvrnfxhDnmCCnlYb2
         OPCa5BKBBKRXErasc4GHkusgSLnztexRtxgw/zhgUOMCaFQERcc7U4Z1/8G0aSUOwgjI
         tN+YI6ite6lAmlRmOJLzxGvm0bwLjbNDFT8bNBG/1xKHFdmeD4i4MVG2YkCSz3DeW0xd
         frCA==
X-Gm-Message-State: APjAAAWpH0zH7pgxAwgPsKMUoYbMzHBj6enBm/VLrerkKrIbqvhJ8Cqi
        voWZKdNCr1jD9sEx+pgcUx/kOz0vR2HtjQ12hotg3w==
X-Google-Smtp-Source: APXvYqzSYjUMsNyaW8sZ9zntR3WRn2N4+MrJ+PCBLWVWhT+aI0bg5hzjDQWFOwtMtWQWDKuQMnfbqSflUKrXtF5NdqY=
X-Received: by 2002:a9d:2d89:: with SMTP id g9mr18159633otb.126.1574652049319;
 Sun, 24 Nov 2019 19:20:49 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.21.9999.1911221842200.14532@viisi.sifive.com>
 <20191123092552.1438bc95@lwn.net> <alpine.DEB.2.21.9999.1911231523390.14532@viisi.sifive.com>
 <CAPcyv4hmagCVLCTYmmv0U8-YD5BEoQPV=wtm5hbp3MxqwZRQUA@mail.gmail.com>
 <alpine.DEB.2.21.9999.1911231546450.14532@viisi.sifive.com>
 <CAPcyv4hBNfabaZmKs0XF+UT9Py8zJqpNdu5KsToqp305NASKNA@mail.gmail.com>
 <alpine.DEB.2.21.9999.1911231637510.14532@viisi.sifive.com>
 <CAPcyv4iqTR8s0v8jH7haWCBQAzhZinUEsypiH7Ts9FCf+F9Bvg@mail.gmail.com> <alpine.DEB.2.21.9999.1911241841210.22625@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1911241841210.22625@viisi.sifive.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Sun, 24 Nov 2019 19:20:38 -0800
Message-ID: <CAPcyv4gbz996jwQQ5HEJ-L6uqqR+PoA5X6zdDQVnoqcmk+oXPw@mail.gmail.com>
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

On Sun, Nov 24, 2019 at 6:49 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> On Sat, 23 Nov 2019, Dan Williams wrote:
>
> > I'm open to updating the headers to make a section heading that
> > matches what you're trying to convey, however that header definition
> > should be globally agreed upon. I don't want the document that tries
> > to clarify per-subsystem behaviours itself to have per-subsystem
> > permutations. I think we, subsystem maintainers, at least need to be
> > able to agree on the topics we disagree on.
>
> Unless you're planning to, say, follow up with some kind of automated
> process working across all of the profile documents in such a way that it
> would make technical sense for the different sections to be standardized,
> I personally don't see any need at all for profile document
> standardization.  As far as I can tell, these documents are meant for
> humans, rather than computers, to read.  And in the absence of a strong
> technical rationale to limit how maintainers express themselves here, I
> don't think it's justified.
>

It's just a template, you're free to make sub-headings of your own
choosing, but please try to give a contributor that is spanning
subsystems a chance to navigate similar information across profile
documents.
