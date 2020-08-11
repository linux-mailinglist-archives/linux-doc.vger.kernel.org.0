Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4993241E31
	for <lists+linux-doc@lfdr.de>; Tue, 11 Aug 2020 18:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729101AbgHKQZB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 11 Aug 2020 12:25:01 -0400
Received: from ms.lwn.net ([45.79.88.28]:59226 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728947AbgHKQZA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 11 Aug 2020 12:25:00 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 8C8592C0;
        Tue, 11 Aug 2020 16:25:00 +0000 (UTC)
Date:   Tue, 11 Aug 2020 10:24:59 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Puranjay Mohan <puranjay12@gmail.com>
Cc:     skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Dev-tools: Documentation: Replace deprecated :c:func:
 Usage
Message-ID: <20200811102459.6440960b@lwn.net>
In-Reply-To: <20200810183613.25643-1-puranjay12@gmail.com>
References: <20200810183613.25643-1-puranjay12@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 11 Aug 2020 00:06:13 +0530
Puranjay Mohan <puranjay12@gmail.com> wrote:

> Replace :c:func: with func() as the previous usage is deprecated.
> 
> Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
> ---
>  Documentation/dev-tools/kgdb.rst | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Applied, thanks.

jon
