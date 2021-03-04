Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3D5032CE3C
	for <lists+linux-doc@lfdr.de>; Thu,  4 Mar 2021 09:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236347AbhCDIQ3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 4 Mar 2021 03:16:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236354AbhCDIQU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Mar 2021 03:16:20 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D330C061756
        for <linux-doc@vger.kernel.org>; Thu,  4 Mar 2021 00:15:40 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id 2so27703918ljr.5
        for <linux-doc@vger.kernel.org>; Thu, 04 Mar 2021 00:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SJyZlyEHfVnR3j+KQtSDL4OnWvfrZW9Sy7fZt9eeLfo=;
        b=P8t+fHloRwyoIkI05NgYKdBCj+KdvhlHCPckJ8tCWVkZH2q2Hn4sfLlHhYgp7BnoeE
         eoFoUC6WWaVF5Uhle/DtZrldalw0YHLZbr/dsqY9ONnVILQTRJhIm7kJKQNxnLf7awcZ
         VmQRCa+UGKBxD81acuKo6BhSTroMA/vwyMVeDrOZm8bTjoUunxISbeT/rWjXcxl1drK2
         UFv1w96BtYmz4K3KbfXWmO4lsABr2MErnhBVS7tCE4kXU6S3iFWNjTi241Cs32nzI0+6
         9hnbpVuKoLqpwrZKCtQOzcXiifofVpgaQtcqR6RTfqCrMfSb/Mp/d0wX9ctq42TZXGK2
         qPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SJyZlyEHfVnR3j+KQtSDL4OnWvfrZW9Sy7fZt9eeLfo=;
        b=Cr+8QInilhKrkv1dWhn4lxPa+1xQZLAzp6RQl6L91wpFTP0X1xCW3m5ylMPQB17wmg
         /Ml25q2HXb2LpHeOxskXvwNRdQW4PXjMYlhIBG9JH3kRrdOYXT4BysiQ1DWnVRF5NxQU
         ZSQMzclG3Ig/SRf6XwsFN7IRU4MFy5C8HR2vB5lAYYaiLy83fJojZINJk9gfO4t8DLiS
         uyj/xQpLp8oyaZJeFFgONQFfrFQr/JRJKjl2rOw9qQs13Vyu3sbe2yB++Jaxzn3lRBQU
         MHcD2LHJaHsa6tuRXzFvdpr49rUNrlup6uanF7t+CPAjURoHHHDsPXVj1Rh0eHPf6UnY
         VhCw==
X-Gm-Message-State: AOAM532P1dJakYC7K786Sk+ayP+x0N1B9rSISAAOB3HDP0fyD+x6LBW4
        dDUQ0amSM6nE3wL4dVc8MNUrDV/pSjQGbicS7o15spLAHLCHNg==
X-Google-Smtp-Source: ABdhPJytRMXDzPZQu9LPmyCokZi4HFF5dQrsReDzAH3IBF+V58SrZ/BITOlZXALmZp0DjFGB3W+fMGqSsDPtpdNrgfY=
X-Received: by 2002:a2e:9004:: with SMTP id h4mr1678123ljg.326.1614845738903;
 Thu, 04 Mar 2021 00:15:38 -0800 (PST)
MIME-Version: 1.0
References: <20210303203444.3140677-1-j.neuschaefer@gmx.net>
In-Reply-To: <20210303203444.3140677-1-j.neuschaefer@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Mar 2021 09:15:28 +0100
Message-ID: <CACRpkdbG7LJ9jwdsdAxTad8LSKH_9BqcL0N+DMhg6Sxp6Mr=uQ@mail.gmail.com>
Subject: Re: [PATCH] docs: driver-api: gpio: consumer: Mark another line of
 code as such
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 3, 2021 at 9:35 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> Make it so that this #include line is rendered in monospace, like other
> code blocks.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
