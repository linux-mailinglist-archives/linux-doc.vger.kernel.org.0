Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 677832B27CF
	for <lists+linux-doc@lfdr.de>; Fri, 13 Nov 2020 23:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgKMWGG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 13 Nov 2020 17:06:06 -0500
Received: from ms.lwn.net ([45.79.88.28]:50942 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725981AbgKMWGB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 13 Nov 2020 17:06:01 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7A11A734;
        Fri, 13 Nov 2020 22:06:01 +0000 (UTC)
Date:   Fri, 13 Nov 2020 15:06:00 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: driver-api: mtd: intel-spi: Improve formatting of
 shell commands
Message-ID: <20201113150600.2125a326@lwn.net>
In-Reply-To: <20201108151005.1843666-1-j.neuschaefer@gmx.net>
References: <20201108151005.1843666-1-j.neuschaefer@gmx.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun,  8 Nov 2020 16:10:04 +0100
Jonathan Neuschäfer <j.neuschaefer@gmx.net> wrote:

> Format the shell commands and output in steps 6 and 8 as code blocks,
> for consistency with the rest of the document.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  Documentation/driver-api/mtd/intel-spi.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

jon
