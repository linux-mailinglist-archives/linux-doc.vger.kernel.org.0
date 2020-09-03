Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 125A425CC73
	for <lists+linux-doc@lfdr.de>; Thu,  3 Sep 2020 23:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgICVke (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 3 Sep 2020 17:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbgICVke (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Sep 2020 17:40:34 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F65C061244
        for <linux-doc@vger.kernel.org>; Thu,  3 Sep 2020 14:40:33 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 063A17DE;
        Thu,  3 Sep 2020 21:40:32 +0000 (UTC)
Date:   Thu, 3 Sep 2020 15:40:31 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Drew DeVault <sir@cmpwn.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Improvements to submitting-patches.rst
Message-ID: <20200903154031.0faded85@lwn.net>
In-Reply-To: <20200903160545.83185-1-sir@cmpwn.com>
References: <20200903160545.83185-1-sir@cmpwn.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu,  3 Sep 2020 12:05:41 -0400
Drew DeVault <sir@cmpwn.com> wrote:

> Thanks for the feedback Jonathan! This one should be good to go.

Indeed it is - applied, thanks.

One little thing: it would have been good to keep Randy's Reviewed-by tag
for patch 2; I poked it in.

jon
