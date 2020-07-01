Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3585C211642
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2020 00:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726235AbgGAWru (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 1 Jul 2020 18:47:50 -0400
Received: from foss.arm.com ([217.140.110.172]:56944 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726121AbgGAWru (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 1 Jul 2020 18:47:50 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 983451FB;
        Wed,  1 Jul 2020 15:47:49 -0700 (PDT)
Received: from [10.37.12.95] (unknown [10.37.12.95])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36B503F73C;
        Wed,  1 Jul 2020 15:47:48 -0700 (PDT)
Subject: Re: [PATCH v5 3/5] coresight: etm: perf: Add default sink selection
 to etm perf.
To:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, coresight@lists.linaro.org,
        mathieu.poirier@linaro.org
Cc:     corbet@lwn.net
References: <20200616164006.15309-1-mike.leach@linaro.org>
 <20200616164006.15309-4-mike.leach@linaro.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <428d5f64-cdec-a865-9e3c-ba4ddc4e6d9c@arm.com>
Date:   Wed, 1 Jul 2020 23:52:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20200616164006.15309-4-mike.leach@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06/16/2020 05:40 PM, Mike Leach wrote:
> Add default sink selection to the perf trace handling in the etm driver.
> Uses the select default sink infrastructure to select a sink for the perf
> session, if no other sink is specified.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
