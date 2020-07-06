Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 688EC215EE7
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2020 20:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729764AbgGFSkA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 6 Jul 2020 14:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729695AbgGFSj7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Jul 2020 14:39:59 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7FA1C061755;
        Mon,  6 Jul 2020 11:39:59 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 49E5D2AE;
        Mon,  6 Jul 2020 18:39:59 +0000 (UTC)
Date:   Mon, 6 Jul 2020 12:39:58 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Puranjay Mohan <puranjay12@gmail.com>
Cc:     skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Security: Documentation: Replace deprecated :c:func:
 Usage
Message-ID: <20200706123958.0d9b3ffd@lwn.net>
In-Reply-To: <20200706183437.7239-1-puranjay12@gmail.com>
References: <20200706183437.7239-1-puranjay12@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue,  7 Jul 2020 00:04:37 +0530
Puranjay Mohan <puranjay12@gmail.com> wrote:

> Replace :c:func: with ``func()`` as the previous usage is deprecated.
> Remove an extra ')' to fix broken cross reference.
> 
> Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
> ---
> V1: Change the subject line and remove deprecated :c:func: usage
> ---
>  Documentation/security/credentials.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/security/credentials.rst b/Documentation/security/credentials.rst
> index 282e79feee6a..77b534f61c2a 100644
> --- a/Documentation/security/credentials.rst
> +++ b/Documentation/security/credentials.rst
> @@ -453,9 +453,9 @@ still at this point.
>  
>  When replacing the group list, the new list must be sorted before it
>  is added to the credential, as a binary search is used to test for
> -membership.  In practice, this means :c:func:`groups_sort` should be
> -called before :c:func:`set_groups` or :c:func:`set_current_groups`.
> -:c:func:`groups_sort)` must not be called on a ``struct group_list`` which
> +membership.  In practice, this means ``groups_sort()`` should be
> +called before ``set_groups()`` or ``set_current_groups()``.
> +``groups_sort()`` must not be called on a ``struct group_list`` which
>  is shared as it may permute elements as part of the sorting process
>  even if the array is already sorted.

Almost ... but please leave off the ``quotes`` as well - just say
groups_sort().

Thanks,

jon
