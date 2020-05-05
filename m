Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81BD81C5CB9
	for <lists+linux-doc@lfdr.de>; Tue,  5 May 2020 17:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730476AbgEEP5j (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 5 May 2020 11:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729892AbgEEP5i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 May 2020 11:57:38 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D549BC061A0F;
        Tue,  5 May 2020 08:57:38 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7C97E737;
        Tue,  5 May 2020 15:57:38 +0000 (UTC)
Date:   Tue, 5 May 2020 09:57:37 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wang Wenhu <wenhu.wang@vivo.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@vivo.com, Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] doc: thermal: add cpu-idle-cooling to index tree
Message-ID: <20200505095737.15f42d53@lwn.net>
In-Reply-To: <20200429131109.80891-1-wenhu.wang@vivo.com>
References: <20200429131109.80891-1-wenhu.wang@vivo.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 29 Apr 2020 06:11:09 -0700
Wang Wenhu <wenhu.wang@vivo.com> wrote:

> Add cpu-idle-cooling.rst to the index list for user reference through
> self-compiled htmldocs or online documentation tree of kernel.
> 
> Like: https://www.kernel.org/doc/html/latest/driver-api/thermal/index.html
> 
> Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  Documentation/driver-api/thermal/cpu-idle-cooling.rst | 3 +++
>  Documentation/driver-api/thermal/index.rst            | 1 +
>  2 files changed, 4 insertions(+)

Applied, thanks.

jon
