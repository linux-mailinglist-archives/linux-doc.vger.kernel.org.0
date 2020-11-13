Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C920C2B27CD
	for <lists+linux-doc@lfdr.de>; Fri, 13 Nov 2020 23:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726003AbgKMWFV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 13 Nov 2020 17:05:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgKMWFU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Nov 2020 17:05:20 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A64C0617A6;
        Fri, 13 Nov 2020 14:05:19 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 807C14FA;
        Fri, 13 Nov 2020 22:05:19 +0000 (UTC)
Date:   Fri, 13 Nov 2020 15:05:18 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wang Qing <wangqing@vivo.com>
Cc:     Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 DOC] doc: zh_CN: add translatation for tmpfs
Message-ID: <20201113150518.075e5ba7@lwn.net>
In-Reply-To: <1604887072-12997-1-git-send-email-wangqing@vivo.com>
References: <1604887072-12997-1-git-send-email-wangqing@vivo.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon,  9 Nov 2020 09:57:47 +0800
Wang Qing <wangqing@vivo.com> wrote:

> Translate Documentation/filesystems/tmpfs.rst into Chinese.
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> 
> Changes in v4:
>  - Modify as Alex required.
>  
> Changes in v3:
>  - Fix patch format issue.
> ---
>  .../translations/zh_CN/filesystems/tmpfs.rst       | 146 +++++++++++++++++++++
>  1 file changed, 146 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/filesystems/tmpfs.rst

Applied, thanks.

jon
