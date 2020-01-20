Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB66B142D45
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jan 2020 15:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgATOXJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 20 Jan 2020 09:23:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:55804 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726738AbgATOXJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 20 Jan 2020 09:23:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 9421DAF36;
        Mon, 20 Jan 2020 14:23:07 +0000 (UTC)
Date:   Mon, 20 Jan 2020 15:23:06 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/26] docs: i2c: smbus-protocol: remove unneeded colons
 from table
Message-ID: <20200120152306.6d98f01d@endymion>
In-Reply-To: <20200105225012.11701-13-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
        <20200105225012.11701-1-luca@lucaceresoli.net>
        <20200105225012.11701-13-luca@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun,  5 Jan 2020 23:49:59 +0100, Luca Ceresoli wrote:
> These colons are not needed: the columns already nicely separate the
> symbold from their description. They are also inconsistently preceded by
> whitespace.

s/symbold/symbols/

> 
> Remove the colons completely to simplify and clean up.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  Documentation/i2c/smbus-protocol.rst | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
