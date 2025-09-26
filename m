Return-Path: <linux-doc+bounces-61928-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5385FBA45C8
	for <lists+linux-doc@lfdr.de>; Fri, 26 Sep 2025 17:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CAF716278B
	for <lists+linux-doc@lfdr.de>; Fri, 26 Sep 2025 15:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CDF1E7C2D;
	Fri, 26 Sep 2025 15:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="hPsK5H8r"
X-Original-To: linux-doc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA931EBA1E;
	Fri, 26 Sep 2025 15:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758899401; cv=none; b=QFCiPpLb6E4g4uE5PphganWbxI/Jq4cS2OWBy2NhiXwU6X36qO9lpEdEL3MM4+cMJnJ2adwUYfEdD6KtLKDRAzssP83wevagFSlDePcQYmBppzIQSkiHA057Bbq6OmZcRLzQcYdd4tLb/6ZUYSUp6k0IfKD/BUTFEn4lnXDkzqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758899401; c=relaxed/simple;
	bh=ivNT1eteHqufzSJjAjZmr4HnsxVvU/t+Nx0pFIRIIXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uq6Oq8KfGbBNkiubNb61Pm43f2Qivgod2zgDGz7OsNsoIcqOVD7e2iMqWrDJBwxap3HLekssTI7AyBUjS9PEt38cpEpQdSkSZWUcbg/gy7gSiu8uzHcDbCnF8NjCn+Gk2fV86EL8zILPuA+5Ph+SHNrd1QlNxmbNQf6PGKRnVOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=hPsK5H8r; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=XSMa1nZ1fyVY7e50A5uoHQmIhnvReTboBFu/aOYjOn8=; b=hPsK5H8r3BWbRd6UcwHHfEX39A
	AWSiU0frfKD8wuAIiawn6QdTbWBe8xFyOqTcXwGG6VnmlIvzffRIPlG4iJrdFdnhdIJdKc3lGAEYa
	PyeAbVB8Om2B9M3ZNaRdQ4b/jitxfgqjmEzeuntXyT1vAuY3NFE9Y06eiZGsJPGLY2kM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v2A55-009ZoP-9X; Fri, 26 Sep 2025 17:09:55 +0200
Date: Fri, 26 Sep 2025 17:09:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Markus Heidelberg <m.heidelberg@cab.de>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: networking: phy: clarify abbreviation "PAL"
Message-ID: <52edd445-1d1c-46ac-b97d-1645f01eef1a@lunn.ch>
References: <20250926131520.222346-1-m.heidelberg@cab.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926131520.222346-1-m.heidelberg@cab.de>

On Fri, Sep 26, 2025 at 03:15:20PM +0200, Markus Heidelberg wrote:
> It is suddenly used in the text without introduction, so the meaning
> might have been unclear to readers.
> 
> Signed-off-by: Markus Heidelberg <m.heidelberg@cab.de>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

