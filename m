Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 321972326B4
	for <lists+linux-doc@lfdr.de>; Wed, 29 Jul 2020 23:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgG2VVP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 29 Jul 2020 17:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgG2VVO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Jul 2020 17:21:14 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEDBBC061794
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2020 14:21:14 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t1so3393836plq.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2020 14:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4cNs+7hBDrJJFF3RZJCU5MjW7BEY57UdmNncqGv7XW0=;
        b=GbuIoss799fpxkZnm0SYdn000h504UOS4nrjBbKfeCyT9pCtSXPAa0yYE+p/Wn2ie7
         wKcW4D3Fby+dXUryis4FKQ3ygnSQrswx1pXMM432XJLt4fzS1Fnqi7d3sdl+odnaMVyW
         wlDmZLNYwfSOKzJvQD4EuAro1lx+/mkhLyNQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4cNs+7hBDrJJFF3RZJCU5MjW7BEY57UdmNncqGv7XW0=;
        b=jkFDmnd+IS4jJb8Ud4790lrcL60CqgosfXITF0zy1QASQcAn3Fk7IS9X+wMR+E6s9i
         MyhbhVYpirPnqaaOXoIApnAXlcBqdE72pjtSmeu/SY+JTAKBoBjFZ+Od5mFXeomri9Y2
         DD48TE42GbzD7Jk/QL2pG1OQGf96M3Drzr83LpD/d0tCgMtgeZMZX8s+Bcux9QR41yw2
         Tq6HZFan/laePqyiX6AK5EoN6sZxXW58DrciLNJlTJ/ff2NEelnUEfpN+MSLywujFl4l
         qjTDNHg60YWBnWlk4V1sua0AzWroZkgiAJjq7eNOVXQ70HxQSNhjQ7e9uWl0xaKmwWrx
         XRXQ==
X-Gm-Message-State: AOAM531MAkGfQRSY8o/42wFG0EmwbFsGSQhYqlvybTD2vxGMxAtK2Q4k
        NhhdSH2UH9ZMqIhSU57dNsfLyw==
X-Google-Smtp-Source: ABdhPJyPxKNUEd+mjvsAeMJyuXrA+ik1vdTmlRfXsc7r52p7jWmRt6YvoNpG9kjxDlaDg62mR8c0Ug==
X-Received: by 2002:a17:902:cb0f:: with SMTP id c15mr14036676ply.85.1596057674351;
        Wed, 29 Jul 2020 14:21:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s68sm2854361pfb.103.2020.07.29.14.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 14:21:13 -0700 (PDT)
Date:   Wed, 29 Jul 2020 14:21:12 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     torvalds@linux-foundation.org, lokeshvutla@ti.com,
        tony@atomide.com, daniel.lezcano@linaro.org,
        thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
        davem@davemloft.net, hkallweit1@gmail.com, vkoul@kernel.org,
        grygorii.strashko@ti.com, peter.ujfalusi@ti.com,
        santosh.shilimkar@oracle.com, t-kristo@ti.com,
        zaslonko@linux.ibm.com, akpm@linux-foundation.org,
        catalin.marinas@arm.com, Dave.Martin@arm.com, broonie@kernel.org,
        yu-cheng.yu@intel.com, Thinh.Nguyen@synopsys.com,
        felipe.balbi@linux.intel.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] include: Replace HTTP links with HTTPS ones
Message-ID: <202007291420.9AF368B18@keescook>
References: <20200726110117.16346-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200726110117.16346-1-grandmaster@al2klimov.de>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jul 26, 2020 at 01:01:17PM +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

Jon, do you want to take this?

-- 
Kees Cook
