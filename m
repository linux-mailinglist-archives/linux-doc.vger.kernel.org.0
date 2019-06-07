Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 423A3385F4
	for <lists+linux-doc@lfdr.de>; Fri,  7 Jun 2019 10:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbfFGIIl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 7 Jun 2019 04:08:41 -0400
Received: from verein.lst.de ([213.95.11.211]:54564 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725978AbfFGIIl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 Jun 2019 04:08:41 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 9D93D68C4E; Fri,  7 Jun 2019 10:08:14 +0200 (CEST)
Date:   Fri, 7 Jun 2019 10:08:14 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     corbet@lwn.net, jroedel@suse.de, hch@lst.de,
        m.szyprowski@samsung.com, linux-doc@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH] Documentation: DMA-API: fix a function name of
 max_mapping_size
Message-ID: <20190607080814.GA10303@lst.de>
References: <1559893633-6852-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559893633-6852-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Looks good.  And it seems like you've also found the solution to
your usb storage problem, but I'm going to post the variant I just
hacked up nevertheless.
