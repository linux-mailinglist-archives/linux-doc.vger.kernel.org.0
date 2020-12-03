Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D21D2CE231
	for <lists+linux-doc@lfdr.de>; Thu,  3 Dec 2020 23:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729632AbgLCWyV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 3 Dec 2020 17:54:21 -0500
Received: from ms.lwn.net ([45.79.88.28]:57066 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727760AbgLCWyU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Dec 2020 17:54:20 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4960022C9;
        Thu,  3 Dec 2020 22:53:40 +0000 (UTC)
Date:   Thu, 3 Dec 2020 15:53:39 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-fsdevel@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: mount_api: change kernel log wording
Message-ID: <20201203155339.11424450@lwn.net>
In-Reply-To: <20201202012409.19194-1-rdunlap@infradead.org>
References: <20201202012409.19194-1-rdunlap@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue,  1 Dec 2020 17:24:09 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> Change wording to say that messages are logged to the kernel log
> buffer instead of to dmesg. dmesg is just one program that can
> print the kernel log buffer.
> 
> Fixes: 7d6ab823d646 ("vfs: Update mount API docs")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: David Howells <dhowells@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/filesystems/mount_api.rst |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

jon
