Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2E001C8B8D
	for <lists+linux-doc@lfdr.de>; Thu,  7 May 2020 14:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbgEGM63 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 7 May 2020 08:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725879AbgEGM62 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 May 2020 08:58:28 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D9CC05BD43
        for <linux-doc@vger.kernel.org>; Thu,  7 May 2020 05:58:27 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id w2so5279368edx.4
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2020 05:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JhXYcpwKf2XpGZELWtHA1frK/acuUyPFrjCaNoc2FRk=;
        b=JHyNVkG+93UuLQKtfOniky75gTXR//TNux3FixdF8PnLgOw9/dy6zBIhm248HfGnCl
         90JDM8VELNhrd5z34reDxxxJNI3ibPs/qJy1Nw0lwklQiEwVDZt7Zia9HH4BLqFdSIn/
         LkXmpaioVzgbR/RCZdp5Y+LC9SGlIu69v97t2YKM1qv4uk4DRq4PTzk9nZ8nrn3TQvUf
         +kDkattSiHnljhbNJdSBG/ipnDep7QQRc9enZF8bfUYqttNxFQ1GBsqE4BnmI0qkEVnG
         RUQsD0Zb2jWXYAPCK5Cs6oXrn6Pdl06KLdgVGGK/YzDF5KRCCWhDti6+uxGXzQh9tY1s
         fKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JhXYcpwKf2XpGZELWtHA1frK/acuUyPFrjCaNoc2FRk=;
        b=rwy5syRQkySPdfhaEVNVGo89AEbvPRyxE3i/AJ//A2vP7W5H87lpiErZDVdXBs66f7
         WoN8Z5PwOwczW1k/b9lf0RH/Q/Exz7SD+0OpnkNhwYWqb1W1Bh7Ex6zIkOBuVEZOXKdd
         gCxcfG2Pqa28wx00OF7isFdDuPSObAPJzZtF6LPe+jF/WcQGaQiCP9nU5wEHoGqvNRBb
         W56rnIcLoO6wbzzFK3Qho3vaos2GtNuMux9wBUTnbxwdjcdH6nBpYyDvRcPiGx1WHfAk
         QmiRMIAZ3zT/UygOPdvLXgPDQz0tlz/3Bxt6mZCL6dU15ve0t4GUHsEy3mQqOKQ+V4yR
         xKQg==
X-Gm-Message-State: AGi0PuawNuU0b9WodMMQqt30SawvAdAOHEe15NbbQ3L4Sm0Fsc6rxVpw
        M+p/IrWFTQsbMMteMAGbXF9uh8646Gv8bVxCTUiNmw==
X-Google-Smtp-Source: APiQypJW23seoNUjQ9Cjb9iCJOyGQrSpBnxCRp+l1gSYgC9RrkDJ7cqjnZwF8iBU8cJartiNHh3Pvba2heWCxCMCrFA=
X-Received: by 2002:aa7:cfc3:: with SMTP id r3mr12143634edy.342.1588856306666;
 Thu, 07 May 2020 05:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200506211523.15077-1-keescook@chromium.org> <20200506211523.15077-4-keescook@chromium.org>
In-Reply-To: <20200506211523.15077-4-keescook@chromium.org>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Thu, 7 May 2020 08:57:50 -0400
Message-ID: <CA+CK2bCu8eFomiU+NeBjVn-o2dbuECxwRfssNjB3ys3caCbXeA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] pstore/ram: Refactor DT size parsing
To:     Kees Cook <keescook@chromium.org>
Cc:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        James Morris <jmorris@namei.org>,
        Sasha Levin <sashal@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 6, 2020 at 5:15 PM Kees Cook <keescook@chromium.org> wrote:
>
> Refactor device tree size parsing routines to be able to pass a non-zero
> default value for providing a configurable default for the coming
> "max_reason" field.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>

ramoops_parse_dt_size
parse_size

Are used to parse flags, and max-reason properties, so the "size" in
their names become outdated. How about:
ramoops_parse_dt_prop
parse_prop

Otherwise it looks good.

Thank you,
Pasha
