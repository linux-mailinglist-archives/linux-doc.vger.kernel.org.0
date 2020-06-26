Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1B9320BBA0
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2020 23:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgFZVdE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 26 Jun 2020 17:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgFZVdC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jun 2020 17:33:02 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E1B6C03E97A
        for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2020 14:33:02 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id l63so5467336pge.12
        for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2020 14:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=isGI70+czOYX8LYvRhZpcPAvKyFNKEPZ2af3yPbAFwI=;
        b=LiYJGYFoXJP9NdTWRWQnsw8sojKk2XNyauPgbVrUQ4KV6YX9RKsid/d8JtVlvnpxBa
         kZjOaTyiQ7C5PlTOVs3B8l8qGn6OcJon3YnViItkxbqWEA1SEy38nFZN308uIc2d/U0P
         UcJCd+T2lawIni5nxisTS95QZKtBi43/FYsys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=isGI70+czOYX8LYvRhZpcPAvKyFNKEPZ2af3yPbAFwI=;
        b=BoKnP6e9bHKnvc9lbwHWSMXNXiAbCN3DhNMrgg/UKFrzKgilOr4MY3yBkJ5nD7LheI
         QJR8heA0EUp5vBKmFpfZ6btriWbr9ob4SRa+MXEjI3PWBwIj47iy/BrNYecWbmMl7MVY
         2XFEZOpmUIHxlydBC7E9yj1ya6l6/SCXai7Ud1THIc06W/viVGjolYhrGaF36uGIvdUl
         Hej4Frxl+d/eulWMVazEP0sgZjFnIgr1LLMevHVNUKc5L5iKW3VuiOQyS4ZmdgDuQaJq
         AziiqgOAFFyq0cPkZZdajINXi2iizTFpPh06AANujG3PmaamlnvSguQK+SeIeSdkXWDQ
         c6Wg==
X-Gm-Message-State: AOAM533T5W7HwHXcLiKCKYXbZvHliqudlnkPbDM65jOgZWB0Wc5k/8ST
        QTjWv40JvrfMBfQMJcmISCXMvQ==
X-Google-Smtp-Source: ABdhPJxK5PIGVit9dOqCU8WR/AxLS9sbmSmKWgE1WwIbdSsDXubZymhiuhL1Ke1iv631E7AwjZS6EA==
X-Received: by 2002:a63:417:: with SMTP id 23mr663893pge.44.1593207181950;
        Fri, 26 Jun 2020 14:33:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p19sm26713683pff.116.2020.06.26.14.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 14:33:01 -0700 (PDT)
Date:   Fri, 26 Jun 2020 14:33:00 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Brendan Higgins <brendanhiggins@google.com>
Cc:     jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
        arnd@arndb.de, skhan@linuxfoundation.org, alan.maguire@oracle.com,
        yzaikin@google.com, davidgow@google.com, akpm@linux-foundation.org,
        rppt@linux.ibm.com, frowand.list@gmail.com,
        catalin.marinas@arm.com, will@kernel.org, monstr@monstr.eu,
        mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
        chris@zankel.net, jcmvbkbc@gmail.com, gregkh@linuxfoundation.org,
        sboyd@kernel.org, logang@deltatee.com, mcgrof@kernel.org,
        linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH v5 08/12] init: main: add KUnit to kernel init
Message-ID: <202006261431.BB35444FB6@keescook>
References: <20200626210917.358969-1-brendanhiggins@google.com>
 <20200626210917.358969-9-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626210917.358969-9-brendanhiggins@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 26, 2020 at 02:09:13PM -0700, Brendan Higgins wrote:
> Remove KUnit from init calls entirely, instead call directly from
> kernel_init().
> 
> Co-developed-by: Alan Maguire <alan.maguire@oracle.com>
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
