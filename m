Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 958D3772F0
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jul 2019 22:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbfGZUne (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 26 Jul 2019 16:43:34 -0400
Received: from ms.lwn.net ([45.79.88.28]:52162 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726522AbfGZUne (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 26 Jul 2019 16:43:34 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 3B23A4BF;
        Fri, 26 Jul 2019 20:43:34 +0000 (UTC)
Date:   Fri, 26 Jul 2019 14:43:33 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu,
        codalist@coda.cs.cmu.edu, linux-doc@vger.kernel.org
Subject: Re: [PATCH v1] coda: Fix typo in the struct CodaCred documentation
Message-ID: <20190726144333.244ea568@lwn.net>
In-Reply-To: <20190723165750.66229-1-andriy.shevchenko@linux.intel.com>
References: <20190723165750.66229-1-andriy.shevchenko@linux.intel.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 23 Jul 2019 19:57:50 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> Documentation mistakenly refers to a different type while explaining
> the contents of the struct CodaCred.
> 
> Fix the typo in the struct CodaCred description in the documentation.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

People still use coda? :)

Applied, thanks.

jon
