Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9D7B232A53
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jul 2020 05:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728343AbgG3DUP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 29 Jul 2020 23:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726724AbgG3DUO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Jul 2020 23:20:14 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83679C061794
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2020 20:20:13 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id y206so3940384pfb.10
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2020 20:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1CdvmZ2y3O11xRbSas05vz3yxZKjjWMivmHxLl+TXRw=;
        b=OM/JL5bnbfc8/rOT7SazeRLNGTmcPwnhSE2CSA1CqhgNigfDwfzLxj0BPkWlYqYW9b
         6HEndzeOJuiNQ3xhOFhtDT3B/+SJbDE1Rc6iM/UP1jwrQPCHhZxDHS+us8Ru12XI6i5c
         UIQLDvoCch0lcO+j+J5v2PcLL5b6UMAmqdn0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1CdvmZ2y3O11xRbSas05vz3yxZKjjWMivmHxLl+TXRw=;
        b=JAsO24ITxAvCV7rQ5+ldMJzxCnSLX2CuEFTYJWrf/wJ588L6OWfvidKu+FCCmzW/qT
         FWkU8hWn9Kvi7F4jS8rQPma25xtymhO9eBrxqXv9xNgiNFmW62I04xHHyIC7SDzYYRCr
         cKM4/W4mDiEvmrZCgtxXk14IFQUspWdVD7hbzg+pGnkQB+rBFQ2uSkyowuWJBlOaTQRu
         XdW8L1EI0MSpthyIn/qpx674l3Nk8ZoRFaZS4dXd3efYohOv0aPX6Pfojkyn8WH5aXX8
         jwK6tNZyoqc4PEuDt0TDf1bv159DwnGzuKKG2mA3gYqLo9RP9ywHmP0OR4zgG+0MSw0+
         zNkg==
X-Gm-Message-State: AOAM532xkhaGS8LX2vPmP+c/f5LulUUVqx39hH5jKeSA2leg5Py3zX9l
        hcaGiFdoLAo0VA8yLhPA46sgYA==
X-Google-Smtp-Source: ABdhPJy0dnH/Y0r3adW9sU/4OMzLuJibNCs455u5u3r4V8O/DyZvrAFqVZFLvxR8iTMi//1kkpVS0g==
X-Received: by 2002:a63:140f:: with SMTP id u15mr30513554pgl.94.1596079213134;
        Wed, 29 Jul 2020 20:20:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t17sm4064454pgu.30.2020.07.29.20.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 20:20:12 -0700 (PDT)
Date:   Wed, 29 Jul 2020 20:20:11 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        torvalds@linux-foundation.org, lokeshvutla@ti.com,
        tony@atomide.com, daniel.lezcano@linaro.org,
        thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
        davem@davemloft.net, hkallweit1@gmail.com, vkoul@kernel.org,
        grygorii.strashko@ti.com, peter.ujfalusi@ti.com,
        santosh.shilimkar@oracle.com, t-kristo@ti.com,
        zaslonko@linux.ibm.com, catalin.marinas@arm.com,
        Dave.Martin@arm.com, broonie@kernel.org, yu-cheng.yu@intel.com,
        Thinh.Nguyen@synopsys.com, felipe.balbi@linux.intel.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] include: Replace HTTP links with HTTPS ones
Message-ID: <202007292020.12C777FAB4@keescook>
References: <20200726110117.16346-1-grandmaster@al2klimov.de>
 <202007291420.9AF368B18@keescook>
 <20200729144510.d77300ba8f7e891fb9fb595d@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729144510.d77300ba8f7e891fb9fb595d@linux-foundation.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 29, 2020 at 02:45:10PM -0700, Andrew Morton wrote:
> On Wed, 29 Jul 2020 14:21:12 -0700 Kees Cook <keescook@chromium.org> wrote:
> 
> > On Sun, Jul 26, 2020 at 01:01:17PM +0200, Alexander A. Klimov wrote:
> > > Rationale:
> > > Reduces attack surface on kernel devs opening the links for MITM
> > > as HTTPS traffic is much harder to manipulate.
> > > 
> > > Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> > 
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> > 
> > Jon, do you want to take this?
> 
> I added this to -mm yesterday.

Ah excellent. :) Thanks!

-- 
Kees Cook
