Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18D52176470
	for <lists+linux-doc@lfdr.de>; Mon,  2 Mar 2020 20:57:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgCBT54 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 2 Mar 2020 14:57:56 -0500
Received: from ms.lwn.net ([45.79.88.28]:58412 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726098AbgCBT54 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 2 Mar 2020 14:57:56 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A08B42E4;
        Mon,  2 Mar 2020 19:57:55 +0000 (UTC)
Date:   Mon, 2 Mar 2020 12:57:54 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     clm@fb.com, hannes@cmpxchg.org, tj@kernel.org, lizefan@huawei.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH doc 0/5] doc: cgroup: improve formatting
Message-ID: <20200302125754.71633083@lwn.net>
In-Reply-To: <20200228000653.1572553-1-kuba@kernel.org>
References: <20200228000653.1572553-1-kuba@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 27 Feb 2020 16:06:48 -0800
Jakub Kicinski <kuba@kernel.org> wrote:

> A few small changes to the cgroup-v2 doc to improve
> it's rendering.
> 
> Jakub Kicinski (5):
>   doc: cgroup: improve formatting
>   doc: cgroup: improve formatting of mem stats
>   doc: cgroup: improve formatting of io example
>   doc: cgroup: improve formatting of cpuset examples
>   doc: cgroup: improve formatting of references
> 
>  Documentation/accounting/psi.rst              |  2 ++
>  Documentation/admin-guide/cgroup-v1/index.rst |  2 ++
>  Documentation/admin-guide/cgroup-v2.rst       | 28 ++++++-------------
>  3 files changed, 12 insertions(+), 20 deletions(-)

I've applied the set, thanks.

jon
