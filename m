Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 969E4E3A92
	for <lists+linux-doc@lfdr.de>; Thu, 24 Oct 2019 20:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503968AbfJXSEE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 24 Oct 2019 14:04:04 -0400
Received: from ms.lwn.net ([45.79.88.28]:42568 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503967AbfJXSEE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 24 Oct 2019 14:04:04 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 3F8E1736;
        Thu, 24 Oct 2019 18:04:03 +0000 (UTC)
Date:   Thu, 24 Oct 2019 12:04:03 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Harald Seiler <hws@denx.de>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: driver-api: Remove reference to sgi-ioc4
Message-ID: <20191024120403.742deb2b@lwn.net>
In-Reply-To: <20191022195747.226104-1-hws@denx.de>
References: <20191022195747.226104-1-hws@denx.de>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 22 Oct 2019 21:57:48 +0200
Harald Seiler <hws@denx.de> wrote:

> Commit f7bc6e42bf12 ("drivers: remove the SGI SN2 IOC4 base support")
> removed support for SGI SN2 IOC4 and the relevant documentation files.
> Remove a leftover reference in the toctree of the driver-api
> documentation to fix this sphinx error:
> 
>     Documentation/driver-api/index.rst:14: WARNING: toctree contains
>         reference to nonexisting document 'driver-api/sgi-ioc4'
> 
> Signed-off-by: Harald Seiler <hws@denx.de>

Applied, thanks.

jon
