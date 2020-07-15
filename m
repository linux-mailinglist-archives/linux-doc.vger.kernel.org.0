Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A095A220193
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2020 03:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgGOBDO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 14 Jul 2020 21:03:14 -0400
Received: from smtprelay0087.hostedemail.com ([216.40.44.87]:34298 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726187AbgGOBDM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Jul 2020 21:03:12 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id 281BE181D341E;
        Wed, 15 Jul 2020 01:03:11 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:968:982:988:989:1260:1277:1311:1313:1314:1345:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2693:2828:3138:3139:3140:3141:3142:3355:3865:3866:3867:3868:3870:3871:3874:4250:5007:6117:6119:6120:7875:7901:7903:7974:9163:10004:10400:10848:11026:11658:11914:12296:12297:12760:13180:13206:13229:13439:14096:14097:14659:14721:21080:21627:21789:21987:21990:30003:30012:30029:30054,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: rate98_1b17d2126ef5
X-Filterd-Recvd-Size: 3484
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf17.hostedemail.com (Postfix) with ESMTPA;
        Wed, 15 Jul 2020 01:03:10 +0000 (UTC)
Message-ID: <6ca9eee2cd8ea3b45b5d4b93bf177832c7def44d.camel@perches.com>
Subject: Odd style rst conversions of function prototypes?
From:   Joe Perches <joe@perches.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        linux-doc <linux-doc@vger.kernel.org>
Date:   Tue, 14 Jul 2020 18:03:09 -0700
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Kernel-doc output as html seems to use atypical kernel style
where the output does not use the typical kernel-style of
keeping the * next to the object.

Could that be changed so that the docs are output in the same
style as the code?

For example:

/**
 * dvb_module_probe - helper routine to probe an I2C module
 *
 * @module_name:
 *	Name of the I2C module to be probed
 * @name:
 *	Optional name for the I2C module. Used for debug purposes.
 * 	If %NULL, defaults to @module_name.
 * @adap:
 *	pointer to &struct i2c_adapter that describes the I2C adapter where
 *	the module will be bound.
 * @addr:
 *	I2C address of the adapter, in 7-bit notation.
 * @platform_data:
 *	Platform data to be passed to the I2C module probed.
 *
 * This function binds an I2C device into the DVB core. Should be used by
 * all drivers that use I2C bus to control the hardware. A module bound
 * with dvb_module_probe() should use dvb_module_release() to unbind.
 *
 * Return:
 *	On success, return an &struct i2c_client, pointing the the bound
 *	I2C device. %NULL otherwise.
 *
 * .. note::
 *
 *    In the past, DVB modules (mainly, frontends) were bound via dvb_attach()
 *    macro, with does an ugly hack, using I2C low level functions. Such
 *    usage is deprecated and will be removed soon. Instead, use this routine.
 */
struct i2c_client *dvb_module_probe(const char *module_name,
				    const char *name,
				    struct i2c_adapter *adap,
				    unsigned char addr,
				    void *platform_data);

where the kernel-doc html output is:

struct i2c_client * dvb_module_probe(const char * module_name, const char * name, struct i2c_adapter * adap, unsigned char addr, void * platform_data)

    helper routine to probe an I2C module

Parameters

const char * module_name
    Name of the I2C module to be probed
const char * name
    Optional name for the I2C module. Used for debug purposes. If NULL, defaults to module_name.
struct i2c_adapter * adap
    pointer to struct i2c_adapter that describes the I2C adapter where the module will be bound.
unsigned char addr
    I2C address of the adapter, in 7-bit notation.
void * platform_data
    Platform data to be passed to the I2C module probed.

Description

This function binds an I2C device into the DVB core. Should be used by all drivers that use I2C bus to control the hardware. A module bound with dvb_module_probe() should use dvb_module_release() to unbind.

Return

    On success, return an struct i2c_client, pointing the the bound I2C device. NULL otherwise.

Note

In the past, DVB modules (mainly, frontends) were bound via dvb_attach() macro, with does an ugly hack, using I2C low level functions. Such usage is deprecated and will be removed soon. Instead, use this routine.


