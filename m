Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E22D15356E
	for <lists+linux-doc@lfdr.de>; Wed,  5 Feb 2020 17:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbgBEQmH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 5 Feb 2020 11:42:07 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34478 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgBEQmH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Feb 2020 11:42:07 -0500
Received: by mail-qt1-f195.google.com with SMTP id h12so2054680qtu.1
        for <linux-doc@vger.kernel.org>; Wed, 05 Feb 2020 08:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FPWbNXa0GX365VDaKw4gf3KjLGpb9Q8z5VU+lOJXhdM=;
        b=ptQ8OjU1TXuT5kt+I/z0l8OVastf6a/bSiWzp8PyNBxF+Q8Am+Jyooqf6GwwwmYL1q
         V0uc8J52AuP/qqfrWCzWLC2n+jnUs6xlcUt4HXyZFUrLfQxZr2dbFDC669A+3H66e4pl
         JyiYASJKysAQJlngZxa/tyzeadHEpVrRkYo80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FPWbNXa0GX365VDaKw4gf3KjLGpb9Q8z5VU+lOJXhdM=;
        b=pb9DCBewk5iQf6lm0UmIaZIQy0xVawAnkAYr0Y3LNwLQH7l6cjQQlOxLgPrjEDElfo
         1u/mYEeeI7Lq9DUENKi4v3H/EsBtNSGQ90O8rqWUZZSrxrlxraZKejxvof8fCF3otUWn
         RAKZ1LAy86vuXrdpvi0jSNFEO6+zqGLhnx0O/HMxCaE2Z24GkTfXoNaZkg7Nnm128j6o
         eU4kRALxmM8tFRI34ykroy8yuIDOo4A/JqRYoDGb3n8hYNBS8bP888TGVK1R4w6WA7gL
         gBbc2onwvOZylQuu1Rc1nxtdOZgitkrqq9UEkw+r8x4Tqg85HL2hYy7pHpwR9pXJ2V/a
         /LIw==
X-Gm-Message-State: APjAAAXXou041tDBXvU8K119QHUn++qb9BeNK8vQdirg1Olu5VxEboyc
        vpA5MDvsITkg2Lu7I/rfHue0LkHv9zWAauadwWpjoA==
X-Google-Smtp-Source: APXvYqw4zQdAJkzIEl6zOIpRDnqDENQPkurZ6DRxOyGDrw113njTL8jr0uaIuWDNY5iP6ulx5hwdaZ/QITS7blopmcA=
X-Received: by 2002:ac8:145:: with SMTP id f5mr33817629qtg.194.1580920926134;
 Wed, 05 Feb 2020 08:42:06 -0800 (PST)
MIME-Version: 1.0
References: <20200205154629.GA1257054@kroah.com> <20200205160250.GG142103@google.com>
In-Reply-To: <20200205160250.GG142103@google.com>
From:   Joel Fernandes <joel@joelfernandes.org>
Date:   Wed, 5 Feb 2020 08:41:55 -0800
Message-ID: <CAEXW_YTxcqdqTC_+-n_Zqvn1sfDX04Y=CVgqMvPc_27qUMw=HA@mail.gmail.com>
Subject: Re: [PATCH] Revert kheaders feature
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexei Starovoitov <ast@kernel.org>
Cc:     Olof Johansson <olof.johansson@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tejun Heo <tj@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        David Howells <dhowells@redhat.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kbuild@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 5, 2020 at 8:02 AM Joel Fernandes <joel@joelfernandes.org> wrote:
>
> On Wed, Feb 05, 2020 at 03:46:29PM +0000, Greg Kroah-Hartman wrote:
> > Now that BPF does not need a copy of the kernel headers anymore in order
> > to build programs, there's no real need for putting the kernel headers
> > into a kernel module.  So drop the feature quick, before someone starts
> > using it :)
>
> Temporary Nack. Adding Alexei to the thread.
>
> I believe at the time of this going in, the BPF's BTF feature was not fully
> ready or able to support the usecases. Especially because BPF programs can
> call or use macros in kernel headers as well.
>
> Also, now BCC project does depend on this and so does bpftrace. Have both
> of these tools migrated to use BTF and don't need CONFIG_KHEADERS to be
> compiled? Sorry if I lost track.
>

Sorry to call it CONFIG_KHEADERS, obviously I mean CONFIG_IKHEADERS.

thanks,

 - Joel
