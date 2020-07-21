Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A439E22743D
	for <lists+linux-doc@lfdr.de>; Tue, 21 Jul 2020 02:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728311AbgGUA5d (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 20 Jul 2020 20:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727048AbgGUA5d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Jul 2020 20:57:33 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69AD8C061794;
        Mon, 20 Jul 2020 17:57:33 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 1A0C011E8EC3C;
        Mon, 20 Jul 2020 17:40:48 -0700 (PDT)
Date:   Mon, 20 Jul 2020 17:57:32 -0700 (PDT)
Message-Id: <20200720.175732.841920649223347255.davem@davemloft.net>
To:     gnault@redhat.com
Cc:     kuba@kernel.org, netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net, martin.varghese@nokia.com
Subject: Re: [PATCH net] Documentation: bareudp: update iproute2 sample
 commands
From:   David Miller <davem@davemloft.net>
In-Reply-To: <57d0fff72970fdc7d49ab969f940438728f10754.1595259799.git.gnault@redhat.com>
References: <57d0fff72970fdc7d49ab969f940438728f10754.1595259799.git.gnault@redhat.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 20 Jul 2020 17:40:48 -0700 (PDT)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Guillaume Nault <gnault@redhat.com>
Date: Mon, 20 Jul 2020 17:46:58 +0200

> bareudp.rst was written before iproute2 gained support for this new
> type of tunnel. Therefore, the sample command lines didn't match the
> final iproute2 implementation.
> 
> Signed-off-by: Guillaume Nault <gnault@redhat.com>

Applied, thank you.
