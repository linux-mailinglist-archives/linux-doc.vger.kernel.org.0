Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9EFBBC378
	for <lists+linux-doc@lfdr.de>; Tue, 24 Sep 2019 09:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393126AbfIXHzj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 24 Sep 2019 03:55:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43630 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388712AbfIXHzj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 24 Sep 2019 03:55:39 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 39576A2668F;
        Tue, 24 Sep 2019 07:55:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com [10.36.116.47])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E67BA5C1B5;
        Tue, 24 Sep 2019 07:55:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 2B97316E05; Tue, 24 Sep 2019 09:55:38 +0200 (CEST)
Date:   Tue, 24 Sep 2019 09:55:38 +0200
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
        yc_chen@aspeedtech.com, corbet@lwn.net,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 11/12] drm/mgag200: Reserve video memory for cursor
 plane
Message-ID: <20190924075538.vvg7q2jrderil653@sirius.home.kraxel.org>
References: <20190923172753.26593-1-tzimmermann@suse.de>
 <20190923172753.26593-12-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923172753.26593-12-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]); Tue, 24 Sep 2019 07:55:39 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

  Hi,

> +	/*
> +	 * At the high end of video memory, we reserve space for
> +	 * buffer objects. The cursor plane uses this memory to store
> +	 * a double-buffered image of the current cursor. Hence, it's
> +	 * not available for framebuffers.
> +	 */
> +	mdev->vram_fb_available -= 2 * size;

Hmm, that looks like a leftover from the previous version of the patch
series ...

cheers,
  Gerd

