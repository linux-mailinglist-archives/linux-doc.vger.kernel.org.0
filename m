Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02AC3B12A0
	for <lists+linux-doc@lfdr.de>; Thu, 12 Sep 2019 18:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbfILQTi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 12 Sep 2019 12:19:38 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55022 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbfILQTi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Sep 2019 12:19:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
        :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=buo3wFeGj6gL5BdLNGR9y2RVrZDmlHNR8p/k48B6Rng=; b=PIbE8CrxXUzbtj4qLX0KIF34X6
        nKQjFaBbq8DsIdpGB/4q0y2geACICNaR1DtsRe+GaVdDLgGhn6Mn9BDIvrW3mbUmL5Nev7r4nGfhG
        xugONNAE6Ez5B2haRBOwjfQm9aZ25FKDhO2hiQ9oPCkbyr2MGzeYoxCw6JUWEcMBKK2fQWB/U9UWO
        j6PHrZHGnDbqzk3QpHuGE5EFIlrWHdE8FGyhlMo7pduUZ9HfA5Y4vzKQtt9DAnHjjwyMztcLZsP7C
        XTjLcYfOYeAdFMtsFmu2gBvSRx+LyNF6E2LOicOUHsfn48SgQWrAOqyVkMO3gRMh8Da1JP9y16KSn
        Keu2X/Ww==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.2 #3 (Red Hat Linux))
        id 1i8Ron-0007dh-90; Thu, 12 Sep 2019 16:19:37 +0000
Date:   Thu, 12 Sep 2019 09:19:37 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@collabora.com>
Cc:     linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net, axboe@kernel.dk, m@bjorling.me,
        kernel@collabora.com, krisman@collabora.com
Subject: Re: [PATCH 3/3] null_blk: validated the number of devices
Message-ID: <20190912161937.GK29434@bombadil.infradead.org>
References: <20190911144636.226945-1-andrealmeid@collabora.com>
 <20190911144636.226945-3-andrealmeid@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190911144636.226945-3-andrealmeid@collabora.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 11, 2019 at 11:46:36AM -0300, Andr� Almeida wrote:
>  
> -static int nr_devices = 1;
> +static unsigned int nr_devices = 1;
>  module_param(nr_devices, int, 0444);

^^^ you forgot to change the module_param to match

> +	if (!nr_devices) {
> +		pr_err("null_blk: invalid number of devices\n");
> +		return -EINVAL;
> +	}

I don't think this is necessary.
