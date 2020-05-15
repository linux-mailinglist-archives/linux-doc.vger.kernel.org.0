Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 704AD1D5A07
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2020 21:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgEOTbF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 15 May 2020 15:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726197AbgEOTbF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 May 2020 15:31:05 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3E23C05BD0A
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2020 12:31:04 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id d16so3142128edq.7
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2020 12:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vErvnQoqbf5Meaqtse3zpzTQXTThCj+PlNibNhhv2Uo=;
        b=FKh4uRFuzk6LWrSXDP88E2gJbQI+bBtvd2Vrw7lgHu5eyGOb+HDjTj2KDYFJxLUWzB
         PeZd/YkHHi25f64qU7/fLCFVGlERXsCjnxhlPRoAPpUYPCS+rmfQlU95K29FzuDaYRU1
         DB5aTnj3yrcjckhA/nS5y/+P1iauWWrbkRD5BHYJlSy71m6X61xPbEfO0sKbRrA75lmQ
         0SV5LPanC51ygC4iYuKyA1gPRqiKOWdHrmIvWhdmUpTWlJnEH8lXicDlYcgQ98lpSm5+
         cRmYG4HbwPlg1LKXAdiwuFNu/WuRc8kWB33kOw6rB15rTCvWOEmMSbQwGdErqx0Gd1vf
         3/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vErvnQoqbf5Meaqtse3zpzTQXTThCj+PlNibNhhv2Uo=;
        b=ROpzmFnWJ1MifrV5elFXYjz8kqQv4AmRSYVAKfAdGuQ9lQGPCj0XWJqCiOYL9RJX1i
         fZe6lxa/0IiMiE/NKQ9aUEH4THw3+7Ck1Zn+uGzepyyMDdQLPtJu3vQistO6t3CBvilq
         +66AFAtF02aiFWEXmcWWmJfU/5Pk6Bd8hJNANGcMltC0QuieyBQSGUJwhryUiw04EqZP
         8CifBBHeN+y9jmbqucNhhhrnOsLM44t2thAy6bltLCZrZvvy60fSesZ09yElw5flAc43
         2GGMS5xaOu/OGvlN2eBK6yuS66Eg7gIIbBRSjIspFbhLIyVVzUTEHS7PP/ijhv9T0i2u
         fB5A==
X-Gm-Message-State: AOAM533dhjLES2XwRVVPmO95UC0t0FeVpaunxAoq8p5uto0INTOwndXu
        HuaH80mYoQEIHfRBVJgGGV5LRjDsTQ5MpGplzW1p3A==
X-Google-Smtp-Source: ABdhPJxVNhuoHXSVLn9PLNKxdspcJcNGGfAsekctXnv0fKnHI35D8TQO83ALfAlxb/fVSimNFlN5uGf+30lkrJL6Cxw=
X-Received: by 2002:aa7:da04:: with SMTP id r4mr4302843eds.346.1589571063296;
 Fri, 15 May 2020 12:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200515184434.8470-1-keescook@chromium.org> <20200515184434.8470-6-keescook@chromium.org>
In-Reply-To: <20200515184434.8470-6-keescook@chromium.org>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Fri, 15 May 2020 15:30:27 -0400
Message-ID: <CA+CK2bAvTo1=oLH32-Wdz07F3OP=T+gA6GgzkBH1Q9W8upHkNg@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] pstore/ram: Introduce max_reason and convert dump_oops
To:     Kees Cook <keescook@chromium.org>
Cc:     Petr Mladek <pmladek@suse.com>, Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Benson Leung <bleung@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

>  #define parse_u32(name, field, default_value) {                                \
>                 ret = ramoops_parse_dt_u32(pdev, name, default_value,   \

The series seems to be missing the patch where ramoops_parse_dt_size
-> ramoops_parse_dt_u32 get renamed, and updated to handle default
value.
