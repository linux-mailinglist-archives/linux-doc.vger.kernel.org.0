Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D18D1FB27D
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2020 15:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728997AbgFPNud (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 16 Jun 2020 09:50:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726306AbgFPNuc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Jun 2020 09:50:32 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E926FC06174E
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2020 06:50:30 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id c21so11797360lfb.3
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2020 06:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wklf5cduJTJAJSagxCZumX6yp4Hs/DNK3FMK6q52ulU=;
        b=fbajd8JY6EU5T65vTAox3j3j/UZcRkLsWmnhWNiGEKqmgtMSBIZ4ORKA9QXN6dbr+V
         d+j0MQ4OtwlRLwIqF7P/NZdBisemn4F3q3QIV/dc2262ECub3QuRhmQvRp4JfB5919eW
         ffnaGL7TAi+pGAKfxrKkweuqA9OXyj0AYY3ijtQcMHthw00h1WdiaFZmY7O6bBR+m1lw
         Qe3tEjhG0OZpa8YfSbpVo7l6c9kl+h7sivrB+YchfuxuswK9UdLKYMbmgwcHGvzxmKXw
         doqOOzoqUmgsqYdUKLCP6OA9BAcd2MWT/tRyL6eY27z15I149Jf6QOUWniEmaWV2vpdx
         x1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wklf5cduJTJAJSagxCZumX6yp4Hs/DNK3FMK6q52ulU=;
        b=acLt/8CL5bdYECZjSj+qbdMDwIx7nTQPnbRoWMkQfUQKvnSLMEtWBngjbF+3GCrC7v
         L232KH4tgy5DdIyYejJ5unrB+ZtKLxZGPx8NdiF7w2VQVS9K1tWjVJOdnJ4RonFsVo0O
         b5Hiq3mpXB2vQKTcbqL8gCiUHQCp9Z/jWpU+EYCLChcr+Gyk3dxFCBzYnpp9zrZtpzVn
         rbAWUFu+16skd6gvhivxIpM1ktTzhz0/vEFMModXv3Dm6Zbn+zbY4W+w9uFNF7qUkmck
         kig1VU6yfTTP1ZbmS4CK9Q/53VTu/gil5PSyKxEemvkPm/eWDi1E8z1wme0LxekCsMvd
         0Kgw==
X-Gm-Message-State: AOAM533P4kg4EgI7I2mPpDwgJT2jai/N6d7Ea3ilwZ7QgDHcKdYnrq7a
        fMURUh0QZt8EshdSxhi9BDJRs5soHhfvC9BvH8J1jg==
X-Google-Smtp-Source: ABdhPJx9KyXZK7Z/6zNonFouOfo1+V9/FZ8bo3GzemYuTqETrcc2CZb22ALh+Gf2oItWAbfviIDofbV5tiP7NBW5AWU=
X-Received: by 2002:ac2:41d4:: with SMTP id d20mr1812062lfi.204.1592315429181;
 Tue, 16 Jun 2020 06:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <1591253979-29067-1-git-send-email-sumit.garg@linaro.org> <20200615201907.GE5416@linux.intel.com>
In-Reply-To: <20200615201907.GE5416@linux.intel.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Tue, 16 Jun 2020 19:20:17 +0530
Message-ID: <CAFA6WYOpXmdabrpbyJqeknkwv1NeD4+tp95zP+si23SSXDwJdQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: tee: Document TEE kernel interface
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Jens Wiklander <jens.wiklander@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Maxim Uvarov <maxim.uvarov@linaro.org>,
        "tee-dev @ lists . linaro . org" <tee-dev@lists.linaro.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 16 Jun 2020 at 01:49, Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Thu, Jun 04, 2020 at 12:29:39PM +0530, Sumit Garg wrote:
> > Update documentation with TEE bus infrastructure which provides an
> > interface for kernel client drivers to communicate with corresponding
> > Trusted Application.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
>
> Please at least broadly describe the update in the commit message.
>

How about following additional info to the above commit description?

Brief description of changes:
- Add a section to describe TEE kernel interface along with a TEE
client driver example snippet.
- Add a sub-section for OP-TEE driver to describe OP-TEE specific
device enumeration.

-Sumit

> /Jarkko
