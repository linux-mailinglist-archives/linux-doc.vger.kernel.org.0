Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C8B26B193
	for <lists+linux-doc@lfdr.de>; Wed, 16 Sep 2020 00:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbgIOWcr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 15 Sep 2020 18:32:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:59534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727597AbgIOQRR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 15 Sep 2020 12:17:17 -0400
Received: from gaia (unknown [46.69.195.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E0FD621D7B;
        Tue, 15 Sep 2020 16:13:46 +0000 (UTC)
Date:   Tue, 15 Sep 2020 17:13:44 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Phil Chang <phil.chang@mediatek.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        YJ Chiang <yj.chiang@mediatek.com>,
        Alix Wu <alix.wu@mediatek.com>,
        Mike Rapoport <rppt@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] [PATCH] ARM64: Setup DMA32 zone size by bootargs
Message-ID: <20200915161344.GD14908@gaia>
References: <20200915150855.24825-1-phil.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915150855.24825-1-phil.chang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 15, 2020 at 11:08:55PM +0800, Phil Chang wrote:
> Allowing the DMA32 zone be configurable in ARM64 but at most 4Gb.

Why? What is your use-case?

-- 
Catalin
