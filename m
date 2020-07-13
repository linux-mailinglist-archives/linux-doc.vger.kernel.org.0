Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D238D21A717
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2020 20:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgGIScB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 9 Jul 2020 14:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbgGIScA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Jul 2020 14:32:00 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B50AEC08C5CE
        for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2020 11:32:00 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id o13so1350023pgf.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2020 11:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rDbdxwqrSb9n9LxA3TuonvCnzIU4pzGVQs1EJezV9vI=;
        b=IExuYAwJf/cXPpA4SudXZ2w5OHC3j3edAggaPx7e0vrrshwRPNirltfq0VxU2sVbGo
         5PpTHKlKcA9enS2c9LDWKkfI8cEHWDV/r02mawXgD9M7EMAmrbEck7XPauCSf4O8j+CL
         AW4AT58oGdMKRDmWGWReHya2rtULAFWLrrDs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rDbdxwqrSb9n9LxA3TuonvCnzIU4pzGVQs1EJezV9vI=;
        b=TFA5NdOsDAGL5xPfMbg3yS18h00MWlKFH+QStEILpmxdd/KlYpuPWVf5A2pIRFHwZE
         fTknA+fqFsVZr4822x2PxLxUD08d3NQ410r9zSFKYnXt4FijNWx8O1SqQ3ynNBYruMGQ
         TQwH+Yed2zdg25cyKeqPzMmelLwUhXt4tj/UP1/gmeYe1ugJKbm+o7/frI71Il8eyOq+
         WGHy44k3r8k2li1S87J/rEm8B3fGuEL+CEA5C7YH48rghnyJig1S2VhYnXCGSttqCoTc
         xeOMWnYh3//UyzQmmykBIlJZ/ye34i0VOhnCckc58GvkR4dlh0oDYosY1v5kICcdJvdi
         ZumQ==
X-Gm-Message-State: AOAM530nymse/C/508p/q14PGGYt4ACmNuyNJjfJKzTqD7IAZ72PVr7W
        y+X1QSyaM/ZHLB+TEUmOXf6eYA==
X-Google-Smtp-Source: ABdhPJzJke1hBySm6nQnsR1KYFItaH7Bi3pVqtBQ+hlsjXaYtFqhMsQAWVVD60S8zKKrp4LX6vl6kA==
X-Received: by 2002:a63:de4b:: with SMTP id y11mr31517390pgi.26.1594319520178;
        Thu, 09 Jul 2020 11:32:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y6sm3560168pfp.7.2020.07.09.11.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 11:31:59 -0700 (PDT)
Date:   Thu, 9 Jul 2020 11:31:58 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Replace HTTP links with HTTPS ones: YAMA SECURITY MODULE
Message-ID: <202007091129.7D0E2534D2@keescook>
References: <20200708073346.13177-1-grandmaster@al2klimov.de>
 <202007080103.2DAD857D4C@keescook>
 <2c05c0c3-e72a-7cc6-3391-2e0d3bdf6b2c@al2klimov.de>
 <202007081531.085533FC5@keescook>
 <596fa9f8-954a-c452-2399-e063f4b04f57@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <596fa9f8-954a-c452-2399-e063f4b04f57@al2klimov.de>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 09, 2020 at 08:45:14AM +0200, Alexander A. Klimov wrote:
> And as it's the only URL here, of course the whole patch makes no sense
> anymore. If I'd replace the URL as you said, I'd make a *new patch* with a
> *new title* and just send it --in-reply-to here. And my statement "just
> forget [the old] patch" would still stand.

We must be talking past each other. The doc has 2 links. You suggested
changing one, I suggested also changing the other.

> Also IMAO in this particular case *I don't deserve* to be the author of the
> new patch as *you did all the work* for it – i.e. figured out the
> replacement URL.

That's fine -- I'm mainly interested in just getting the document
improved. I will send a v2...

-- 
Kees Cook
