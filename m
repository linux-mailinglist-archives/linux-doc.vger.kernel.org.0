Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED47C21163C
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2020 00:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726235AbgGAWoO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 1 Jul 2020 18:44:14 -0400
Received: from foss.arm.com ([217.140.110.172]:56678 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726114AbgGAWoO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 1 Jul 2020 18:44:14 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D42B81FB;
        Wed,  1 Jul 2020 15:44:13 -0700 (PDT)
Received: from [10.37.12.95] (unknown [10.37.12.95])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 806643F73C;
        Wed,  1 Jul 2020 15:44:12 -0700 (PDT)
Subject: Re: [PATCH v5 1/5] coresight: Add default sink selection to CoreSight
 base.
To:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, coresight@lists.linaro.org,
        mathieu.poirier@linaro.org
Cc:     corbet@lwn.net
References: <20200616164006.15309-1-mike.leach@linaro.org>
 <20200616164006.15309-2-mike.leach@linaro.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <104482e4-f674-0053-1c42-08518073105d@arm.com>
Date:   Wed, 1 Jul 2020 23:48:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20200616164006.15309-2-mike.leach@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mike,

On 06/16/2020 05:40 PM, Mike Leach wrote:
> Adds a method to select a suitable sink connected to a given source.
> 
> In cases where no sink is defined, the coresight_find_default_sink
> routine can search from a given source, through the child connections
> until a suitable sink is found.
> 
> The suitability is defined in by the sink coresight_dev_subtype on the
> CoreSight device, and the distance from the source by counting
> connections.
> 
> Higher value subtype is preferred - where these are equal, shorter
> distance from source is used as a tie-break.
> 
> This allows for default sink to be discovered were none is specified
> (e.g. perf command line)
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: Leo Yan <leo.yan@linaro.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
