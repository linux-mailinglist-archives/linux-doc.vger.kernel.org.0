Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9FBC353B
	for <lists+linux-doc@lfdr.de>; Tue,  1 Oct 2019 15:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbfJANMS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 1 Oct 2019 09:12:18 -0400
Received: from ms.lwn.net ([45.79.88.28]:36722 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726816AbfJANMS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 1 Oct 2019 09:12:18 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 213E9491;
        Tue,  1 Oct 2019 13:12:18 +0000 (UTC)
Date:   Tue, 1 Oct 2019 07:12:17 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Adam Zerella <adam.zerella@gmail.com>
Cc:     Frank.li@nxp.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs: perf: Add imx-ddr to documentation index
Message-ID: <20191001071217.41a12e46@lwn.net>
In-Reply-To: <20190915082009.698-1-adam.zerella@gmail.com>
References: <20190915054533.22008-1-adam.zerella@gmail.com>
        <20190915082009.698-1-adam.zerella@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 15 Sep 2019 18:20:10 +1000
Adam Zerella <adam.zerella@gmail.com> wrote:

> Sphinx is currently outputting a warning where
> the file 'imx-ddr.rst' is not included in the
> documentation index. Additionally, the code
> highlighting and doc formatting can be slightly
> improved.
> 
> Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
> ---
> 
> v2: Supress additional indentation warning

Applied, thanks; apologies for the delay.

jon
