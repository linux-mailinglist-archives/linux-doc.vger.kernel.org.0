Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE3494869EA
	for <lists+linux-doc@lfdr.de>; Thu,  6 Jan 2022 19:30:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242766AbiAFSal (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 6 Jan 2022 13:30:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbiAFSal (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Jan 2022 13:30:41 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55615C061245
        for <linux-doc@vger.kernel.org>; Thu,  6 Jan 2022 10:30:41 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id d1so9950244ybh.6
        for <linux-doc@vger.kernel.org>; Thu, 06 Jan 2022 10:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g/xBmitbOHdtVQAn4LWhzl9UDVKn43GVAgVY+5ZmJg0=;
        b=lm4tCA4hSwJFZzf7M1gFEOFx/YaTAqH2uGxpeuV7H+Y+iFmSf3jqiINBDiM8dotE1g
         vh0i54AmsJdL94uLVUBeVn1plrq+pe0i4/s7wbo0u5kxm9Pg854TAdAgPziVoECNfuOh
         HNCVktu2dX/G3rQcE4kat9b/UOwrGrwCN3f609XUrSceea00L2mZ6+E3AoU5paWh7ZGM
         wRsCRhPvJ+24K79euDokqYoF8DBWbx39PWvVKhNGsyL4E8PsVByTd5TespNnQL3WRhOD
         UZVoDaaWi/McJeOCkN5unWvQI1dJcQZRgo8Xgfl0srCXW4S/hXkDHymr1f7YKmlVqfsa
         O9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g/xBmitbOHdtVQAn4LWhzl9UDVKn43GVAgVY+5ZmJg0=;
        b=whTnZn8ScWKtZQ98rc98LSRPlUAqyl1U2ww/Ww4Q5bZI2sQstYho0dWDUCIKDKnWVC
         jE7zSFyFngsBIRVRJzTwzqOdmqsyQbDqWNGNf7xIWUUEn+nzf5jx3Tydc3TtXkM3Ik0R
         D6Mc6IOzhTW+npHg0ycKVUB6LoBc4KzeJplxJRwMkviRPgT5pq1zDFSQUcf08WiSdbgm
         aUN2uy2UJit5RUaxEhRe4WDgaAoTOhh4csl9sFQAJXXdm0hZyuHquwgOlCu9llWp3F+u
         pE4ANgnTO4SyFB5VMRCHTQZoaSi0eiOcu+2Z3qHCZxkBcHiuFOeKUEwkF10mT86cxAyt
         l+VA==
X-Gm-Message-State: AOAM531UKHiZGoI8ftRdj6KSfwDCf1N9Oppcwn4nk+EKCDhQONUkfJ75
        jAdOdOXlBOvoXjZbZI/GqudVH1YLrkkZwbqxvaUpi8smlIe8Dg==
X-Google-Smtp-Source: ABdhPJwIzJFCyAw+ArQRHeCJK7ZFP38UP4LYuFJ8oyZ4oXkOfDCeI4LeSPJ2rHk53N7EWrs6fXvjAHblXMh9kMG3QTk=
X-Received: by 2002:a25:d0d1:: with SMTP id h200mr8701861ybg.489.1641493840385;
 Thu, 06 Jan 2022 10:30:40 -0800 (PST)
MIME-Version: 1.0
References: <20211229215330.4134835-1-yaelt@google.com> <db88a381739e08806e2370e8fbe8fdde82731464.camel@kernel.org>
In-Reply-To: <db88a381739e08806e2370e8fbe8fdde82731464.camel@kernel.org>
From:   Yael Tiomkin <yaelt@google.com>
Date:   Thu, 6 Jan 2022 13:30:29 -0500
Message-ID: <CAKoutNvX3S=TmhLFg9UVQaUjFbdp3brN5tUM3_QqBo=9d2Dw+w@mail.gmail.com>
Subject: Re: [PATCH v4] KEYS: encrypted: Instantiate key with user-provided
 decrypted data
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     linux-integrity@vger.kernel.org, jejb@linux.ibm.com,
        Mimi Zohar <zohar@linux.ibm.com>, corbet@lwn.net,
        dhowells@redhat.com, jmorris@namei.org, serge@hallyn.com,
        keyrings@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-security-module <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 5, 2022 at 3:12 PM Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> On Wed, 2021-12-29 at 16:53 -0500, Yael Tiomkin wrote:
> > The encrypted.c class supports instantiation of encrypted keys with
> > either an already-encrypted key material, or by generating new key
> > material based on random numbers. This patch defines a new datablob
> > format: [<format>] <master-key name> <decrypted data length>
> > <decrypted data> that allows to instantiate encrypted keys using
> > user-provided decrypted data, and therefore allows to perform key
> > encryption from userspace. The decrypted key material will be
> > inaccessible from userspace.
>
> The 2nd to last sentence is essentially a tautology but fails to
> be even that, as you can already "perform key encryption" from user
> space, just not with arbitrary key material.
>
> It does not elighten any applications of this feature.
>
> /Jarkko

Sure. Please look at the modification below.

The encrypted.c class supports instantiation of encrypted keys with
either an already-encrypted key material, or by generating new key
material based on random numbers. This patch defines a new datablob
format: [<format>] <master-key name> <decrypted data length>
<decrypted data> that allows to inject (and encrypt) user-provided
decrypted data. The decrypted key material will be inaccessible from
userspace. This feature also acts as a building block for a userspace
envelope encryption capability.

Yael
