Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BEF7772CB
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jul 2019 22:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbfGZUe5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 26 Jul 2019 16:34:57 -0400
Received: from ms.lwn.net ([45.79.88.28]:52086 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726554AbfGZUe5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 26 Jul 2019 16:34:57 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 2CB57AAA;
        Fri, 26 Jul 2019 20:34:57 +0000 (UTC)
Date:   Fri, 26 Jul 2019 14:34:56 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     mchehab+samsung@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: admin-guide: Adjust title underline length
Message-ID: <20190726143456.1ba61755@lwn.net>
In-Reply-To: <20190726162754.5341-1-festevam@gmail.com>
References: <20190726162754.5341-1-festevam@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 26 Jul 2019 13:27:54 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> The following warning is seen when building 'make htmldocs':
> 
> Documentation/admin-guide/sysctl/kernel.rst:397: WARNING: Title underline too short.
> 
> Fix it by adjusting the title underline length appropriately.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

So this appears to be fixing a change that came into linux-next via the -mm
tree; it's not in mainline or docs-next.  That means I can't apply it.  I'd
suggest resposting with a copy to Andrew Morton; that should let it land
in the right place.

Thanks,

jon
