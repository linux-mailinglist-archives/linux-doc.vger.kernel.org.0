Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13C3710EDFB
	for <lists+linux-doc@lfdr.de>; Mon,  2 Dec 2019 18:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727766AbfLBRNt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 2 Dec 2019 12:13:49 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42015 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727529AbfLBRNs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Dec 2019 12:13:48 -0500
Received: by mail-pl1-f193.google.com with SMTP id x13so185400plr.9
        for <linux-doc@vger.kernel.org>; Mon, 02 Dec 2019 09:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=64Rtkbp5lv2QBUlTxW71SlutJl/znQZhVAhGmRkDa5A=;
        b=Vk1wssvB/zZH8eG99umAlefNG1L3qcWJrGhvntSWhcfpVqIgNAxOidQi1rwq4EQIXn
         bN4vLm7U3VKPpBs9sda/OGs+oyh9PNagdmFLvXdLj/BS47NPntYenQZ5La3ndeMMvSdE
         skeX0zFDPEe2oYhEETSdTU90kbb3+PL8p4zstc5e0YlF0cKXQ92MxFz36GyVOGZ0X7/M
         K3MrdpOuSClJ+EaJxL7s+dztJNSPhojECu28cIb0F2l3WqnCnMDfk4C/Hj49DL952BEY
         BxZqmEm7yS/3E/w9YNyvwuwajKd5JfcTzCs/nbSRB1EuYZe1m8RWrwueCb+hlp03EFEM
         7wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=64Rtkbp5lv2QBUlTxW71SlutJl/znQZhVAhGmRkDa5A=;
        b=Bqoqtt2e9fXT0YSaFu8c00LETyaWLSIKYO1PbQJp+92nQXIj2ZnyPAn/D3nA9uKIh/
         iijKPA5Vh8/Qt1kd0k87y4t59EGaijGpZZjBt3Jl2HleOqoAqmGK2kTOVOi8iCV3e2cw
         aSfSS3KJmGqP7jva/7RVCkgJ3TiA1HD8qLqnviHJVv5B9U0w78esUg45eBnPHzTwYg7e
         T5e6ZTxHOIJugzIvk2cjWbWwfcbhukOAK1F23+pWrneH7T7nO6yNqWRv2M8HRh7YfqCM
         iDfh2NFrczhBcPtwUiXbW63/MI9sfxGJSHYxWRWQIMCOsQFUkriTucfhZRF6ovJkXv0D
         J4Tg==
X-Gm-Message-State: APjAAAUHU+srUqkjDAz83ggop0G2IjKUIm4WIGiWxB0bZGsraizoVWeK
        Ty0TQgx77G+yADs90jlz3YL6sSyjhsaNvOpzDKzNXg==
X-Google-Smtp-Source: APXvYqw2U7Pcn6yuncEv+9Hnh2ggnupoJ+IowA3xrDVuGtbGVVpYPNpOewznFvm7KtezB3JzP8UOxrp7rkAIVpmh7PQ=
X-Received: by 2002:a17:90a:ff02:: with SMTP id ce2mr16466pjb.117.1575306825934;
 Mon, 02 Dec 2019 09:13:45 -0800 (PST)
MIME-Version: 1.0
References: <1575242724-4937-1-git-send-email-sj38.park@gmail.com> <1575242724-4937-2-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1575242724-4937-2-git-send-email-sj38.park@gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 2 Dec 2019 09:13:37 -0800
Message-ID: <CAFd5g468=suYdH9No7f1qkr-oAvOFS3q4O1iW3ABs57fzsntdw@mail.gmail.com>
Subject: Re: [PATCH 1/6] docs/kunit/start: Use in-tree 'kunit_defconfig'
To:     SeongJae Park <sj38.park@gmail.com>
Cc:     shuah <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        SeongJae Park <sjpark@amazon.de>,
        David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Dec 1, 2019 at 3:25 PM SeongJae Park <sj38.park@gmail.com> wrote:
>
> From: SeongJae Park <sjpark@amazon.de>
>
> The kunit doc suggests users to get the default `kunitconfig` from an
> external git tree.  However, the file is already located under the
> `arch/um/configs/` of the kernel tree.  Because the local file is easier
> to access and maintain, this commit updates the doc to use it.

I agree; this probably makes more sense.

> Signed-off-by: SeongJae Park <sjpark@amazon.de>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Thanks!
