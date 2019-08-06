Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D459837D8
	for <lists+linux-doc@lfdr.de>; Tue,  6 Aug 2019 19:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733206AbfHFR0A (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 6 Aug 2019 13:26:00 -0400
Received: from ms.lwn.net ([45.79.88.28]:45080 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729898AbfHFRZ7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Aug 2019 13:25:59 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A668E2C0;
        Tue,  6 Aug 2019 17:25:58 +0000 (UTC)
Date:   Tue, 6 Aug 2019 11:25:57 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Harry Wei <harryxiyou@gmail.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        SeongJae Park <sj38.park@gmail.com>,
        Tom Levy <tomlevy93@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: update Chinese howto.rst for latexdocs
 making
Message-ID: <20190806112557.6d1310fb@lwn.net>
In-Reply-To: <20190805031758.64156-1-alex.shi@linux.alibaba.com>
References: <20190805031758.64156-1-alex.shi@linux.alibaba.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon,  5 Aug 2019 11:17:58 +0800
Alex Shi <alex.shi@linux.alibaba.com> wrote:

> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> foundd a reference
> error in Chinese howto.rst. which need update introducations for
> latexdocs/epubdocs format doc making.
> 
> So I update this part according to latest howto.rst.

This one doesn't apply to docs-next, and I hesitate to try to fix it
myself.  Any chance of a respin?

Thanks,

jon
