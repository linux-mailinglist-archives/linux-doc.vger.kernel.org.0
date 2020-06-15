Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 099221F9F4F
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2020 20:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731343AbgFOSYa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 15 Jun 2020 14:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731327AbgFOSY3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Jun 2020 14:24:29 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B35F0C05BD43
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2020 11:24:29 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id w20so7943609pga.6
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2020 11:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pl3r1Mo5DEUisrXbKPOtpyPnis/yzGfz3EgWzAoPwXs=;
        b=fT4toYG06r37evU/maAh2RirK9WTvH2JEmqWPeB5OgGr2LHf5lvhX5VIreBX5cQcsk
         8qyUaqFw1i3A5N7EV7RB0ADb6FLd3LhIiiVfmzCCd+inR5KDOu5P9vHm1tJ9ieLCP2r1
         G4EEGO+EPH+3sOrdpbxtwXHgca8jQ+LZN4MNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pl3r1Mo5DEUisrXbKPOtpyPnis/yzGfz3EgWzAoPwXs=;
        b=X2V4b+2xmHnSa5dPNqDuXYbML6S/ibiZ3aZ7IpjTWZH/wC2NJ87Vh7ufrHV2o0AL+a
         veKddLrviDghoe54yTWaBJfbHaxhqIf3GBhTQC2NBsiT84GmJQ8+4U62BZjCqiJ5FRsb
         Vwufs3rIaJG/LYvHNTu3pcvzz1CfjL+vl+5eoVCh4diDsk0CJz47Biybsmwl3PTSQVE6
         0yAeDGEcAeOtdzyXlOZyx2OfCPcUNEIifYfPp0aTneIlrPtlAjmjdM4I96F/T1HohNTn
         XwhAE+36nA9LAhwC45n9hKoi7EcNh+8E0nqvVsExM5yhz9a1Xt7dR8FZvSIZ2BPL86Ba
         7m4w==
X-Gm-Message-State: AOAM5312yPXjF6Y7GTBIZzXtybKGatECh2QJKhYXgwirjDY7gTEutAQ6
        EytpfkeJPEvHYqivOgfAvmxQcg==
X-Google-Smtp-Source: ABdhPJz2j5KqTcW1tgWTu2+4lo+i14GErKTSjLBB+uSZ/F60UMMETlkha5A8A0B6bkLa0R7oM7Sg7g==
X-Received: by 2002:a62:5ac5:: with SMTP id o188mr24743080pfb.37.1592245469314;
        Mon, 15 Jun 2020 11:24:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d6sm225015pjh.5.2020.06.15.11.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 11:24:28 -0700 (PDT)
Date:   Mon, 15 Jun 2020 11:24:27 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Daniel Kiss <daniel.kiss@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 28/29] docs: fs: proc.rst: fix a warning due to a merge
 conflict
Message-ID: <202006151124.89C934DDE6@keescook>
References: <cover.1592203542.git.mchehab+huawei@kernel.org>
 <7d46aec2cb7a5328d260c7c815b9be9737b43ee1.1592203542.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d46aec2cb7a5328d260c7c815b9be9737b43ee1.1592203542.git.mchehab+huawei@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 15, 2020 at 08:47:07AM +0200, Mauro Carvalho Chehab wrote:
> Changeset 424037b77519 ("mm: smaps: Report arm64 guarded pages in smaps")
> added a new parameter to a table. This causes Sphinx warnings,
> because there's now an extra "-" at the wrong place:
> 
> 	/devel/v4l/docs/Documentation/filesystems/proc.rst:548: WARNING: Malformed table.
> 	Text in column margin in table line 29.
> 
> 	==    =======================================
> 	rd    readable
> 	...
> 	bt  - arm64 BTI guarded page
> 	==    =======================================
> 
> Fixes: 424037b77519 ("mm: smaps: Report arm64 guarded pages in smaps")
> Fixes: c33e97efa9d9 ("docs: filesystems: convert proc.txt to ReST")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
