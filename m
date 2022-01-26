Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F38449D3E9
	for <lists+linux-doc@lfdr.de>; Wed, 26 Jan 2022 21:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231428AbiAZU5F (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 26 Jan 2022 15:57:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbiAZU45 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Jan 2022 15:56:57 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 227EDC061751
        for <linux-doc@vger.kernel.org>; Wed, 26 Jan 2022 12:56:56 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id i62so2461749ybg.5
        for <linux-doc@vger.kernel.org>; Wed, 26 Jan 2022 12:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iRMR5V4vy0P4D7D6HxdHshjQs9Ym01noa/r6EwRPAu0=;
        b=oes9XtJSyShtzx2CSBVGbMTDKHa0l4kalzCjnYYyxsVbTsQorvNCdxvHS6Xl+X54y6
         pdqAiycUiIq6AAx0LYmnhXnSo2d0kn4xhNIlipzNVIZp8lwNer0tDWyJl3TEi4bQ4KB+
         SWMAKF9ezNb6zBFz1hY7fyxFEA16hGRfz7WXTKbfSZ4V3alS9s6Ade6Ae20COXz5oZEq
         Tu6C+RwPdefEiuexRtHqXilwQRvbmBRACea3Dz/nFO0uikBYQr0R2ZfWRUVWryW/S6KD
         pq3FQ4xTzz1llkK2fKyrnFYmacEZ6JR1V6pXmNRd5hvwEUU69UFjfvmwQlr8TvF05+9c
         dUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iRMR5V4vy0P4D7D6HxdHshjQs9Ym01noa/r6EwRPAu0=;
        b=X85Yh17SprLTK5G6gfXh6w7vLhYVeUsOfT8SylJ0pjsJjvmCsg6wRtRO7n8MuGOSzB
         7jnKG1nQK4oCnprcuRUGN8xt8ttHkhwcaXJFzm/oFRx0Xg/uJFuc81Pts3O6G71QkEhs
         jvZDLk6/bt142q2JZPMZobnKXjbN4DfeeMZi+kJM00ymNeoweB5kIp3Gisau951N/oEZ
         +PlhilheZLJyDi9LdIdfoHgT0MFP/WFmbzm3WOyBfkx8zGyG4nsXjLk34CBey4rZLtSo
         YOIlQFJvqeEdVwso9wS7WMwjT42b1ID2okn2PoBKFCwLxowBUg09v5jfIWXO2KJWRCnm
         2TcA==
X-Gm-Message-State: AOAM532MPkUG6HQHfftPEZhcKIJ9N7V6vBy7V12bFVlbsoMtUJ1Yf0lY
        945QIWbr79+GKCIDHRNTRmIfT+WS2GjC75Z/CDgphw==
X-Google-Smtp-Source: ABdhPJz5X7xefsqfdpcr/O0hB6Yp3iMquc+kP8ciOakKuBqThWgY0V24etdk6Xb6ydBgpI8kSaTtR9k+jdyNoEDGFEo=
X-Received: by 2002:a25:b11e:: with SMTP id g30mr1202035ybj.328.1643230614970;
 Wed, 26 Jan 2022 12:56:54 -0800 (PST)
MIME-Version: 1.0
References: <CA++MVV3Jse4WZ-zr-SUWQz3Gk_dByU6JduVfUkvQNW+jgm9O4Q@mail.gmail.com>
 <YfFe9+XDPDIdSqF1@iki.fi> <YfFf8fvsDm8lQJgJ@iki.fi>
In-Reply-To: <YfFf8fvsDm8lQJgJ@iki.fi>
From:   Yael Tiomkin <yaelt@google.com>
Date:   Wed, 26 Jan 2022 15:56:44 -0500
Message-ID: <CAKoutNsaHNriobnsQ1X0Qfs=K+YN3JvfhTBnQqPL01AvjRm5EA@mail.gmail.com>
Subject: Re: [PATCH v4] KEYS: encrypted: Instantiate key with user-provided
 decrypted data
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     Martin Ross <mross@pobox.com>, corbet@lwn.net, dhowells@redhat.com,
        jejb@linux.ibm.com, jmorris@namei.org, keyrings@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-security-module <linux-security-module@vger.kernel.org>,
        serge@hallyn.com, Mimi Zohar <zohar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 26, 2022 at 9:51 AM Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> On Wed, Jan 26, 2022 at 04:47:22PM +0200, Jarkko Sakkinen wrote:
> > On Tue, Jan 18, 2022 at 01:26:05PM -0500, Martin Ross wrote:
> > > Hi Jarkko,
> > >
> > > I have been working with Yael on this project so I thought I might add
> > > a bit of background here around the use case that this series of
> > > patches is trying to address.
> > >
> > > At a high level we are trying to provide users of encryption that have
> > > key management hierarchies a better tradeoff between security and
> > > availability.  For available and performance reasons master keys often
> > > need to be released (or derived/wrapped keys created) outside of a KMS
> > > to clients (which may in turn further wrap those keys in a series of
> > > levels).  What we are trying to do is provide a mechanism where the
> > > wrapping/unwrapping of these keys is not dependent on a remote call at
> > > runtime.  e.g.  To unwrap a key if you are using AWS KMS or Google
> > > Service you need to make an RPC.  In practice to defend against
> > > availability or performance issues, designers end up building their
> > > own kms and effectively encrypting everything with a DEK.  The DEK
> > > encrypts same set as the master key thereby eliminating the security
> > > benefit of keeping the master key segregated in the first place.
>
> Mainly this part (would be enough to explain why it is there).
>
> BR, Jarkko

Hi Jarkko,

As for the commit message, WDYT about the following:

KEYS: encrypted: Instantiate key with user-provided decrypted data

For availability and performance reasons master keys often need to be
released outside of a KMS to clients. It would be beneficial to provide a
mechanism where the wrapping/unwrapping of DEKs is not dependent
on a remote call at runtime yet security is not (or only minimally) compromised.
Master keys could be securely stored in the Kernel and be used to wrap/unwrap
keys from userspace.

The encrypted.c class supports instantiation of encrypted keys with
either an already-encrypted key material, or by generating new key
material based on random numbers. This patch defines a new datablob
format: [<format>] <master-key name> <decrypted data length>
<decrypted data> that allows to inject and encrypt user-provided
decrypted data.


I want to make sure we're on the same page before publishing a new version.

Thanks,
Yael
