Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC1C0C351E
	for <lists+linux-doc@lfdr.de>; Tue,  1 Oct 2019 15:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbfJANEM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 1 Oct 2019 09:04:12 -0400
Received: from ms.lwn.net ([45.79.88.28]:36554 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbfJANEM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 1 Oct 2019 09:04:12 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B5C35491;
        Tue,  1 Oct 2019 13:04:11 +0000 (UTC)
Date:   Tue, 1 Oct 2019 07:04:10 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@collabora.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCH 2/2] kernel-doc: add support for
 ____cacheline_aligned_in_smp attribute
Message-ID: <20191001070410.7d7ed2ba@lwn.net>
In-Reply-To: <20190917194146.35642-3-andrealmeid@collabora.com>
References: <20190917194146.35642-1-andrealmeid@collabora.com>
        <20190917194146.35642-3-andrealmeid@collabora.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 17 Sep 2019 16:41:46 -0300
André Almeida <andrealmeid@collabora.com> wrote:

> -    if ($x =~ /(struct|union)\s+(\w+)\s*\{(.*)\}(\s*(__packed|__aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*/) {
> +    if ($x =~ /(struct|union)\s+(\w+)\s*\{(.*)\}(\s*(__packed|__aligned|____cacheline_aligned_in_smp|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*/) {

Sigh...scripts/kernel-doc just makes me want to cry sometimes...

I've applied both patches.  Thanks, and apologies for the delay...

jon
